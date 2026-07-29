import 'package:tazkiyah_core/core.dart';

import 'practice.dart';
import 'practice_completed.dart';

final class CompletePracticeInput {
  const CompletePracticeInput({required this.practice});

  final Practice practice;
}

final class CompletePracticeUseCase extends UseCase<Practice, CompletePracticeInput> {
  const CompletePracticeUseCase();

  @override
  Future<Result<Practice>> call(CompletePracticeInput input) async {
    return Result.success(input.practice.copyWith(isCompleted: true));
  }
}
