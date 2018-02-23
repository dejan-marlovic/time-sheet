// GENERATED CODE - DO NOT MODIFY BY HAND

part of project;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$ProjectSerializable extends SerializableMap {
  String get id;
  String get name;
  String get description;
  void set id(String v);
  void set name(String v);
  void set description(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
      case 'description':
        return description;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Project');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'name':
        name = __value;
        return;
      case 'description':
        description = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Project');
  }

  Iterable<String> get keys => const ['id', 'name', 'description'];
}
