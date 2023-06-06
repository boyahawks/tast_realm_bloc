import 'package:dartz/dartz.dart';
import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';

import '../../../helper/connector/realm_conntector.dart';

class CrossblockRealmServices {
  static final RealmConnector _connector = RealmConnector();

  static Future<List<crossblockRealmModel>> getData() async {
    List<crossblockRealmModel>? result;
    await _connector.open().then((realm) {
      result = realm.all<crossblockRealmModel>().toList();
    });
    return result ?? [];
  }

  static Future<Either<String, String>> save(
      crossblockRealmModel crossblock) async {
    try {
      await _connector.open().then((realm) {
        realm.write(() {
          realm.add(crossblock, update: true);
        });
      });
      return right("Berhasil simpan crossblock");
    } catch (e) {
      return left(e.toString());
    }
  }

  static Future<Either<String, String>> delete(
      crossblockRealmModel crossblock) async {
    try {
      await _connector.open().then((realm) {
        realm.write(() {
          realm.delete(crossblock);
        });
      });
      return right("Berhasil delete crossblock");
    } catch (e) {
      return left(e.toString());
    }
  }
}
