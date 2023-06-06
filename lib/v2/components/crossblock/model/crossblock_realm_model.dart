// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:realm/realm.dart';

part 'crossblock_realm_model.g.dart';

@RealmModel()
class _crossblockRealmModel {
  @PrimaryKey()
  @MapTo("ID")
  late String id;
  @MapTo("USERID")
  late String userID;
  @MapTo("TITLE")
  late String title;
  @MapTo("BLOCKID")
  late String blockID;
  @MapTo("NOTES")
  late String notes;
  @MapTo("DEVICEID")
  late String deviceID;
  @MapTo("UPLOAD")
  late String upload;
  @MapTo("LATITUDE")
  late String latitude;
  @MapTo("LONGITUDE")
  late String longitude;
  @MapTo("CREATEDDATE")
  late String createdDate;
}
