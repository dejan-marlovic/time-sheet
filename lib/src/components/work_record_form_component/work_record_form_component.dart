import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';
import 'package:time_sheet/src/models/work_record.dart';
import 'package:fo_components/fo_components.dart';
import '../../services/work_record_service.dart';
import '../../services/project_service.dart';
import '../../services/user_service.dart';

@Component(
  selector: 'work-record-form',
  templateUrl: 'work_record_form_component.html',
  providers: const [],
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
    formDirectives,
    FoNumberInputComponent,
    FoDateInputComponent,
    FoSelectComponent,
    NgIf
  ],
  styleUrls: const ['work_record_form_component.css'],
)
class WorkRecordFormComponent implements OnChanges {
  WorkRecordFormComponent(this._formBuilder, this.workRecordService,
      this.projectService, this.userService);

  void ngOnChanges(Map<String, SimpleChange> changes) {
    form = _formBuilder.group({
      "description": [
        model?.description,
        Validators.compose([Validators.required])
      ],
    });
  }

  ControlGroup form;

  final FormBuilder _formBuilder;
  final WorkRecordService workRecordService;
  final ProjectService projectService;
  final UserService userService;
  String get strProjectId => model.project_id.toString();
  String get strUserId => model.user_id.toString();
  void set strUserId(String value) => model.user_id = int.parse(value);
  void set strProjectId(String value) => model.project_id = int.parse(value);

  @Input('model')
  WorkRecord model;
}
