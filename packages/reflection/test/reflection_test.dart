import 'package:test/test.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_reflection/reflection.dart';

void main() {
  test('record reflection use case returns saved reflection', () async {
    const useCase = RecordReflectionUseCase();
    final result = await useCase(
      const RecordReflectionInput(
        id: Id('reflection-1'),
        summary: 'I noticed I am stronger in the morning.',
        notes: 'Need to protect the first hour of the day.',
      ),
    );

    expect(result, isA<Success<Reflection>>());
    final reflection = (result as Success<Reflection>).value;
    expect(reflection.id, const Id('reflection-1'));
    expect(reflection.summary, 'I noticed I am stronger in the morning.');
    expect(reflection.notes, 'Need to protect the first hour of the day.');
  });
}
