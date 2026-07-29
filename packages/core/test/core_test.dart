import 'package:tazkiyah_core/core.dart';
import 'package:test/test.dart';

void main() {
  group('Core primitives', () {
    test('entity equality depends on type and id', () {
      const first = _SampleEntity(Id('1'));
      const second = _SampleEntity(Id('1'));
      const third = _SampleEntity(Id('2'));

      expect(first, equals(second));
      expect(first, isNot(equals(third)));
    });

    test('value object equality depends on runtimeType and value', () {
      const first = _SampleValue('same');
      const second = _SampleValue('same');
      const third = _SampleValue('different');

      expect(first, equals(second));
      expect(first, isNot(equals(third)));
    });

    test('result.success holds value', () {
      const result = Result.success(42);
      expect(result, isA<Success<int>>());
      expect((result as Success<int>).value, 42);
    });

    test('result.failure holds failure', () {
      const failure = Failure(code: 'x', message: 'broken');
      const result = Result.failure(failure);
      expect(result, isA<FailureResult<int>>());
      expect((result as FailureResult<int>).failure, failure);
    });
  });
}

final class _SampleEntity extends Entity<Id> {
  const _SampleEntity(super.id);
}

final class _SampleValue extends ValueObject<String> {
  const _SampleValue(super.value);
}
