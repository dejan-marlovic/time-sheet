library work_record;

import 'package:fo_components/fo_components.dart';
import 'package:serializable/serializable.dart';
part 'work_record.g.dart';

@Serializable()
class WorkRecord extends _$WorkRecordSerializable implements FoModel {
  WorkRecord();

  @override
  String id;
  int user_id;
  String description;
  int project_id;
  DateTime date = new DateTime.now();
  double hours;
}
