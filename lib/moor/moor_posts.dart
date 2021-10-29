import 'package:fe_test_task/moor/posts_dao.dart' show MoorPostDao;
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart' show FlutterQueryExecutor;

part 'moor_posts.g.dart';

class MoorPosts extends Table {
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer()();

  IntColumn get userId => integer()();

  TextColumn get title => text()();

  TextColumn get body => text()();
}

@UseMoor(tables: <Type>[MoorPosts], daos: <Type>[MoorPostDao])
class AppDataBase extends _$AppDataBase {
  AppDataBase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
          ),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (Migrator migrator, int from, int to) async {
          if (from <= 2) {
            await migrator.createAll();
          }
        },
      );
}
