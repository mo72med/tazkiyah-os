import 'package:isar_community/isar_community.dart';

part 'app_db.g.dart';

@collection
class AppStateRecord {
  Id id = Isar.autoIncrement;

  late String identityId;
  late String identityDisplayName;
  late String identityMission;

  late String journeyId;
  late String journeyTitle;
  late String journeyDescription;
  late bool journeyIsStarted;

  late String knowledgeCardId;
  late String knowledgeCardTitle;
  late String knowledgeCardSummary;

  late String practiceId;
  late String practiceTitle;
  late String practiceNotes;
  late bool practiceIsCompleted;

  late String reflectionId;
  late String reflectionSummary;
  late String reflectionNotes;
}

final class AppDb {
  AppDb._(this._isar);

  final Isar _isar;

  static Future<AppDb> open() async {
    final isar = await Isar.open(
      [AppStateRecordSchema],
      name: 'tazkiyah_os',
    );
    return AppDb._(isar);
  }

  Future<AppStateRecord?> loadState() async {
    return _isar.appStateRecords.where().findFirst();
  }

  Future<void> saveState(AppStateRecord record) async {
    await _isar.writeTxn(() async {
      await _isar.appStateRecords.put(record);
    });
  }
}
