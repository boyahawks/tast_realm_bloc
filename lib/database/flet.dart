import 'package:realm/realm.dart';
part 'flet.g.dart';

@RealmModel() // define a data model class named `_Car`.
class _flet {
  @PrimaryKey()
  int? id;

  String? name;
  int? kilometers = 500;
}
