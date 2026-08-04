import 'app_db.dart';
import 'app_state.dart';

/// Temporary repository for the application state.
///
/// This repository now talks to the local database adapter. The remaining work
/// is to remove older placeholder seams once the new path is fully validated.
final class AppRepository {
  AppRepository({AppDb? db}) : _db = db;

  AppDb? _db;

  Future<void> init() async {
    _db ??= await AppDb.open();
  }

  Future<AppState> loadOrCreate() async {
    await init();
    final record = await _db!.loadState();
    if (record == null) return AppState.demo();
    return AppState(
      identity: record.toIdentity(),
      journey: record.toJourney(),
      knowledgeCard: record.toKnowledgeCard(),
      practice: record.toPractice(),
      reflection: record.toReflection(),
    );
  }

  Future<void> save(AppState state) async {
    await init();
    await _db!.saveState(AppStateRecord.fromState(state));
  }
}
