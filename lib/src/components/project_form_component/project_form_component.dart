import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';
import 'package:fo_components/fo_components.dart';
import '../../services/project_service.dart';
import 'package:time_sheet/src/models/project.dart';

@Component(
  selector: 'project-form',
  templateUrl: 'project_form_component.html',
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
  styleUrls: const ['project_form_component.css'],
)
class ProjectFormComponent implements OnChanges {
  ProjectFormComponent(this._formBuilder, this.projectService);

  void ngOnChanges(Map<String, SimpleChange> changes) {
    form = _formBuilder.group({
      "name": [
        model?.name,
        Validators.compose([Validators.required])
      ],
      "description": [
        model?.description,
        Validators.compose([Validators.required])
      ],
    });
  }

  ControlGroup form;

  final FormBuilder _formBuilder;
  final ProjectService projectService;

  @Input('model')
  Project model;
}
