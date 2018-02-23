import '../models/project.dart';
import 'package:angular/di.dart';
import 'service.dart';

@Injectable()
class ProjectService extends Service<Project> {
  ProjectService() : super("project");

  Project deserialize(Map<String, dynamic> model_data) {
    model_data["id"] = model_data["id"].toString();

    return new Project()..addAll(model_data);
  }

  @override
  Map<String, dynamic> serialize(Project model) {
    Map<String, dynamic> modelData = model.toMap();
    if (model.id != null) modelData["id"] = int.parse(model.id);

    return modelData;
  }
}
