import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';
import 'package:fo_components/fo_components.dart';
import 'package:time_sheet/src/services/user_service.dart';
import 'package:time_sheet/src/models/user.dart';

@Component(
  selector: 'user-form',
  templateUrl: 'user_form_component.html',
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
  styleUrls: const ['user_form_component.css'],
)
class UserFormComponent implements OnChanges {
  UserFormComponent(this._formBuilder, this.userService);

  ngOnChanges(Map<String, SimpleChange> changes) {
    form = _formBuilder.group({
      'firstname': [
        model?.firstname,
        Validators.compose([Validators.required])
      ],
      'lastname': [
        model?.lastname,
        Validators.compose([Validators.required])
      ],
      'email': [
        model?.email,
        Validators.compose([Validators.required])
      ],
      'password': [
        password,
        Validators.compose([Validators.required])
      ]
    });
  }

  ControlGroup form;
  final FormBuilder _formBuilder;
  final UserService userService;
  String password;

  @Input('model')
  User model;
}
