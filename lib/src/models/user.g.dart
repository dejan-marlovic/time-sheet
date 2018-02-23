// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$UserSerializable extends SerializableMap {
  String get id;
  String get firstname;
  String get lastname;
  String get email;
  void set id(String v);
  void set firstname(String v);
  void set lastname(String v);
  void set email(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'firstname':
        return firstname;
      case 'lastname':
        return lastname;
      case 'email':
        return email;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'User');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'firstname':
        firstname = __value;
        return;
      case 'lastname':
        lastname = __value;
        return;
      case 'email':
        email = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'User');
  }

  Iterable<String> get keys => const ['id', 'firstname', 'lastname', 'email'];
}
