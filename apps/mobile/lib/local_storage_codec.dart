import 'app_state.dart';
import 'app_state_codec.dart';

/// In-memory local storage backed by a codec.
///
/// This remains a placeholder for real device persistence, but it now stores a
/// serialized representation instead of a raw object reference so the next
/// storage backend can replace this class without touching the higher layers.
final class LocalStorageCodec {
  LocalStorageCodec({AppStateCodec? codec}) : _codec = codec ?? const AppStateCodec();

  final AppStateCodec _codec;
  Map<String, Object?>? _encoded;

  AppState? loadAppState() {
    final encoded = _encoded;
    if (encoded == null) return null;
    return _codec.decode(encoded);
  }

  void saveAppState(AppState state) {
    _encoded = _codec.encode(state);
  }
}
