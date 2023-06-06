import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';
import 'package:realm/realm.dart';

class RealmConnector {
  Realm? _realm;

  Future<Realm> open() async {
    if (_realm == null) {
      final config = Configuration.local([
        crossblockRealmModel.schema,
      ], shouldDeleteIfMigrationNeeded: true);
      _realm = await Realm.open(config);
    }

    if (_realm == null) throw ("Koneksi ke database gagal");
    return _realm!;
  }

  close() {
    try {
      if (_realm != null) {
        if (!_realm!.isClosed) _realm!.close();
      }
    } catch (_) {}
  }
}
