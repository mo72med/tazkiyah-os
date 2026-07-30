import 'app_repository.dart';
import 'app_state.dart';

final class AppController {
  AppController({AppRepository? repository})
      : _repository = repository ?? AppRepository() {
    _state = _repository.loadOrCreate();
  }

  final AppRepository _repository;
  late AppState _state;

  AppState get state => _state;

  void replaceState(AppState nextState) {
    _state = nextState;
    _repository.save(nextState);
  }
}
