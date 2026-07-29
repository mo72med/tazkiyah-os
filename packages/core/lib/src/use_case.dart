import 'failure.dart';
import 'result.dart';

abstract class UseCase<Output, Input> {
  const UseCase();

  Future<Result<Output>> call(Input input);
}
