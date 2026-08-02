import 'app_state.dart';
import 'local_persistence.dart';

/// Temporary repository for the application state.
///
/// This is intentionally small and in-memory for now. It is the seam that will
/// later be replaced by a proper local persistence implementation.
final class AppRepository {
  AppRepository({LocalPersistence? storage}) : _storage = storage ?? LocalPersistence();

  final LocalPersistence _storage;

  AppState loadOrCreate() {
    return _storage.loadAppState() ?? AppState.demo();
  }

  void save(AppState state) {
    _storage.saveAppState(state);
  }
}
