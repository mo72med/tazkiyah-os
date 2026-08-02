import 'app_state.dart';
import 'app_state_codec.dart';

/// A minimal local persistence adapter.
///
/// This is still in-memory, but it behaves like a persistence boundary: callers
/// save and load encoded AppState data through a dedicated API, and the
/// implementation can later be replaced with a real on-device backend.
final class LocalPersistence {
  LocalPersistence({AppStateCodec? codec}) : _codec = codec ?? const AppStateCodec();

  final AppStateCodec _codec;
  Map<String, Object?>? _encodedState;

  AppState? loadAppState() {
    final encodedState = _encodedState;
    if (encodedState == null) return null;
    return _codec.decode(encodedState);
  }

  void saveAppState(AppState state) {
    _encodedState = _codec.encode(state);
  }
}
