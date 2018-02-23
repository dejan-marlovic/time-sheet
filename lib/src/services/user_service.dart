import '../models/user.dart';
import 'package:angular/di.dart';
import 'service.dart';

@Injectable()
class UserService extends Service<User> {
  UserService() : super("user");

  User deserialize(Map<String, dynamic> model_data) {
    model_data["id"] = model_data["id"].toString();

    return new User()..addAll(model_data);
  }

  @override
  Map<String, dynamic> serialize(User model) {
    Map<String, dynamic> modelData = model.toMap();
    if (model.id != null) modelData["id"] = int.parse(model.id);

    return modelData;
  }
}
