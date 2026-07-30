import 'app_state.dart';

/// Temporary in-memory local storage abstraction.
///
/// This is a placeholder for the real persistence layer that will later be
/// backed by Hive, Isar, Drift, or another local storage implementation.
final class LocalStorage {
  AppState? _state;

  AppState? loadAppState() => _state;

  void saveAppState(AppState state) {
    _state = state;
  }
}
