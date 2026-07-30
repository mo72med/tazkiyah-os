import 'app_state.dart';

final class AppController {
  AppController({AppState? initialState}) : _state = initialState ?? AppState.demo();

  AppState _state;

  AppState get state => _state;

  void replaceState(AppState nextState) {
    _state = nextState;
  }
}
