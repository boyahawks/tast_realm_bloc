// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossblock_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class crossblockRealmModel extends _crossblockRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  crossblockRealmModel({
    required String id,
    required String userID,
    required String title,
    required String blockID,
    required String notes,
    required String deviceID,
    required String upload,
    required String latitude,
    required String longitude,
    required String createdDate,
  }) {
    RealmObjectBase.set(this, 'ID', id);
    RealmObjectBase.set(this, 'USERID', userID);
    RealmObjectBase.set(this, 'TITLE', title);
    RealmObjectBase.set(this, 'BLOCKID', blockID);
    RealmObjectBase.set(this, 'NOTES', notes);
    RealmObjectBase.set(this, 'DEVICEID', deviceID);
    RealmObjectBase.set(this, 'UPLOAD', upload);
    RealmObjectBase.set(this, 'LATITUDE', latitude);
    RealmObjectBase.set(this, 'LONGITUDE', longitude);
    RealmObjectBase.set(this, 'CREATEDDATE', createdDate);
  }

  crossblockRealmModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'ID') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'ID', value);

  @override
  String get userID => RealmObjectBase.get<String>(this, 'USERID') as String;
  @override
  set userID(String value) => RealmObjectBase.set(this, 'USERID', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'TITLE') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'TITLE', value);

  @override
  String get blockID => RealmObjectBase.get<String>(this, 'BLOCKID') as String;
  @override
  set blockID(String value) => RealmObjectBase.set(this, 'BLOCKID', value);

  @override
  String get notes => RealmObjectBase.get<String>(this, 'NOTES') as String;
  @override
  set notes(String value) => RealmObjectBase.set(this, 'NOTES', value);

  @override
  String get deviceID =>
      RealmObjectBase.get<String>(this, 'DEVICEID') as String;
  @override
  set deviceID(String value) => RealmObjectBase.set(this, 'DEVICEID', value);

  @override
  String get upload => RealmObjectBase.get<String>(this, 'UPLOAD') as String;
  @override
  set upload(String value) => RealmObjectBase.set(this, 'UPLOAD', value);

  @override
  String get latitude =>
      RealmObjectBase.get<String>(this, 'LATITUDE') as String;
  @override
  set latitude(String value) => RealmObjectBase.set(this, 'LATITUDE', value);

  @override
  String get longitude =>
      RealmObjectBase.get<String>(this, 'LONGITUDE') as String;
  @override
  set longitude(String value) => RealmObjectBase.set(this, 'LONGITUDE', value);

  @override
  String get createdDate =>
      RealmObjectBase.get<String>(this, 'CREATEDDATE') as String;
  @override
  set createdDate(String value) =>
      RealmObjectBase.set(this, 'CREATEDDATE', value);

  @override
  Stream<RealmObjectChanges<crossblockRealmModel>> get changes =>
      RealmObjectBase.getChanges<crossblockRealmModel>(this);

  @override
  crossblockRealmModel freeze() =>
      RealmObjectBase.freezeObject<crossblockRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(crossblockRealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, crossblockRealmModel, 'crossblockRealmModel', [
      SchemaProperty('id', RealmPropertyType.string,
          mapTo: 'ID', primaryKey: true),
      SchemaProperty('userID', RealmPropertyType.string, mapTo: 'USERID'),
      SchemaProperty('title', RealmPropertyType.string, mapTo: 'TITLE'),
      SchemaProperty('blockID', RealmPropertyType.string, mapTo: 'BLOCKID'),
      SchemaProperty('notes', RealmPropertyType.string, mapTo: 'NOTES'),
      SchemaProperty('deviceID', RealmPropertyType.string, mapTo: 'DEVICEID'),
      SchemaProperty('upload', RealmPropertyType.string, mapTo: 'UPLOAD'),
      SchemaProperty('latitude', RealmPropertyType.string, mapTo: 'LATITUDE'),
      SchemaProperty('longitude', RealmPropertyType.string, mapTo: 'LONGITUDE'),
      SchemaProperty('createdDate', RealmPropertyType.string,
          mapTo: 'CREATEDDATE'),
    ]);
  }
}
