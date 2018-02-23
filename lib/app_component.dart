import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:fo_components/fo_components.dart';
import 'package:intl/intl.dart';
import 'src/components/work_record_form_component/work_record_form_component.dart';
import 'src/models/work_record.dart';
import 'src/components/project_form_component/project_form_component.dart';
import 'src/components/user_form_component/user_form_component.dart';
import 'src/models/project.dart';
import 'src/models/user.dart';
import 'src/services/project_service.dart';
import 'src/services/user_service.dart';
import 'src/services/work_record_service.dart';
import 'package:vi_auth_client/vi_auth_client.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [
    materialDirectives,
    WorkRecordFormComponent,
    DataTableComponent,
    NgIf,
    FoLoginComponent,
    FoModalComponent,
    ProjectFormComponent,
    UserFormComponent
  ],
  providers: const [
    FORM_PROVIDERS,
    materialProviders,
    WorkRecordService,
    ProjectService,
    PhraseService,
    UserService
  ],
)
class AppComponent {
  AppComponent(this.workRecordService, this.projectService, this.userService) {
    PhraseService.language = "en";
    PhraseService.data = {
      "en": {
        "are_you_sure_delete_this_resource": "Are you sure that you want to delete this resource?",
        "download_csv":"Download csv",
        "new_password": "New password",
        "no_results": "No results",
        "forgot_password":"Forgot password",
        "forgot_password_description":"Enter your email and we will send you a new password.",
        "reset_password_description": "We have sent a token to your email, enter it below",
        "reset_password": "Reset password",
      }
    };
    workRecordService.httpGET();
    projectService.httpGET().then((_) => projectsLoaded = true);
    userService.httpGET().then((_) => usersLoaded = true);
    evaluatedColumns = {
      "user": (FoModel wr) =>
          userService.get(wr["user_id"].toString())?.toString(),
      "project": (FoModel wr) =>
          projectService.get(wr["project_id"].toString())?.name,
      "date": formatDate,
    };
  }

  void onAddWorkRecord() => selectedWorkRecord = new WorkRecord();
  void onAddProject() => selectedProject = new Project();
  void onAddUser() => selectedUser = new User();

  Future onDeleteUser(String id) async
  {
    await loginClient.unregister(userService.get(id).email);
    await userService.httpDELETE(id);
  }

  Future onLogin(Map<String, String> data) async
  {
    loggedIn = true;
    print(data);
  }

  Future onSaveWorkRecord(WorkRecord model) async {
    if (model == null) throw new ArgumentError.notNull("model");
    if (model.id == null) {
      await workRecordService.httpPOST(model);
    } else {
      await workRecordService.httpPUT(model);
    }
    await workRecordService.httpGET();
    selectedWorkRecord = null;
  }

  Future onSaveProject(Project model) async {
    if (model == null) throw new ArgumentError.notNull("project");
    if (model.id == null) {
      await projectService.httpPOST(model);
    } else {
      await projectService.httpPUT(model);
    }
    await projectService.httpGET();
    selectedProject = null;
  }

  Future onSaveUser(User model) async {
    if (model == null) throw new ArgumentError.notNull("user");
    if (model.id == null) {
      await userService.httpPOST(model);
    } else {
      User oldUser = await userService.httpGET(model.id);
      await loginClient.unregister(oldUser.email);
      await userService.httpPUT(model);
    }
    loginClient.register(model.email, userFormComponent.password);
    await userService.httpGET();
    selectedUser = null;
  }

  static String formatDate(FoModel wr) {
    WorkRecord workRecord = wr as WorkRecord;
    DateFormat dateFormatter = new DateFormat('yyyy-MM-dd');
    return dateFormatter.format(workRecord.date);
  }

  String get modalTitle =>
      selectedWorkRecord?.id == null ? "Add work record" : "Edit work record";
  String get modalTitleProject =>
      selectedProject?.id == null ? "Add project" : "Edit project";
  String get modalTitleUser =>
      selectedUser?.id == null ? "Add user" : "Edit user";

  WorkRecord selectedWorkRecord;
  Project selectedProject;
  User selectedUser;
  String password;
  final ProjectService projectService;
  final WorkRecordService workRecordService;
  final UserService userService;
  Map<String, EvaluateColumnFn> evaluatedColumns;
  bool projectsLoaded = false;
  bool usersLoaded = false;
  bool loggedIn = false;
  ViAuthClient loginClient = new ViAuthClient("https://timesheet.minoch.com/auth/index.php/", "timesheet");

  @ViewChild('userForm')
  UserFormComponent userFormComponent;
}
