library user;

import 'package:fo_components/fo_components.dart';
import 'package:serializable/serializable.dart';
part 'user.g.dart';

@Serializable()
class User extends _$UserSerializable implements FoModel {
  User();

  @override
  String toString() => firstname + ' ' + lastname;

  @override
  String id;
  String firstname;
  String lastname;
  String email;
}
