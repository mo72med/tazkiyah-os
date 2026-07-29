import 'package:tazkiyah_core/core.dart';

import 'reflection.dart';
import 'reflection_recorded.dart';

final class RecordReflectionInput {
  const RecordReflectionInput({required this.id, required this.summary, this.notes = ''});

  final Id id;
  final String summary;
  final String notes;
}

final class RecordReflectionUseCase extends UseCase<Reflection, RecordReflectionInput> {
  const RecordReflectionUseCase();

  @override
  Future<Result<Reflection>> call(RecordReflectionInput input) async {
    final reflection = Reflection(id: input.id, summary: input.summary, notes: input.notes);
    return Result.success(reflection);
  }
}
