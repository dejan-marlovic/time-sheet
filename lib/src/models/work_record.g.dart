// GENERATED CODE - DO NOT MODIFY BY HAND

part of work_record;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$WorkRecordSerializable extends SerializableMap {
  String get id;
  int get user_id;
  String get description;
  int get project_id;
  DateTime get date;
  double get hours;
  void set id(String v);
  void set user_id(int v);
  void set description(String v);
  void set project_id(int v);
  void set date(DateTime v);
  void set hours(double v);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'user_id':
        return user_id;
      case 'description':
        return description;
      case 'project_id':
        return project_id;
      case 'date':
        return date;
      case 'hours':
        return hours;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'WorkRecord');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'user_id':
        user_id = __value;
        return;
      case 'description':
        description = __value;
        return;
      case 'project_id':
        project_id = __value;
        return;
      case 'date':
        date = __value;
        return;
      case 'hours':
        hours = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'WorkRecord');
  }

  Iterable<String> get keys =>
      const ['id', 'user_id', 'description', 'project_id', 'date', 'hours'];
}
