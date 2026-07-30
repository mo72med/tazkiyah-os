import 'app_state.dart';

/// Temporary local persistence seam.
///
/// This implementation is still in-memory, but the API is intentionally kept
/// small so it can later be swapped with Hive, Isar, Drift, or another on-device
/// storage backend without changing the callers.
final class LocalStorage {
  AppState? _state;

  AppState? loadAppState() => _state;

  void saveAppState(AppState state) {
    _state = state;
  }
}
