part of "./database.dart";

class DatabaseConnect {
  static Realm? _realm;

  static Future<void> initializeRealm() async {
    var config = Configuration.local([]);
    var realm = Realm(config);
  }

  static Realm? get realmInstance => _realm;
}
