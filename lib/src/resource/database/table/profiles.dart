import 'package:moor/moor.dart';

class Profiles extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get description => text().nullable()();

  TextColumn get image => text().nullable()();

  TextColumn get urls => text().nullable()();

  IntColumn get isDefault => integer().clientDefault(() => 0)();

  DateTimeColumn get createTime => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
