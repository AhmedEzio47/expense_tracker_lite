import 'package:drift/drift.dart';

class ExpensesTable extends Table {
  @override
  String get tableName => 'expenses';

  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  IntColumn get categoryId => integer()();
  TextColumn get receiptFilePath => text().nullable()();
  BoolColumn get isIncome => boolean()();
  DateTimeColumn get createAt => dateTime().withDefault(currentDateAndTime)();
}
