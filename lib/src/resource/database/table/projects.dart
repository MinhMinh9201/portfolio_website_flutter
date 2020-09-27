import 'package:moor/moor.dart';

class Projects extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get image => text()();

  IntColumn get isFromFirebase => integer().clientDefault(() => 1)();

  TextColumn get url => text()();

  DateTimeColumn get createTime => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
