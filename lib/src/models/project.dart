library project;

import 'package:fo_components/fo_components.dart';
import 'package:serializable/serializable.dart';
part 'project.g.dart';

@Serializable()
class Project extends _$ProjectSerializable implements FoModel {
  Project();

  @override
  String toString() => name;

  @override
  String id;
  String name;
  String description;
}
