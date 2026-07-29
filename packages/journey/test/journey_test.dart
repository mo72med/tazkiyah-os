import 'package:test/test.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_journey/journey.dart';

void main() {
  test('start journey use case returns started journey', () async {
    const useCase = StartJourneyUseCase();
    final result = await useCase(
      const StartJourneyInput(
        id: Id('journey-1'),
        title: 'Morning routine',
        description: 'A small daily rhythm for worship and discipline.',
      ),
    );

    expect(result, isA<Success<Journey>>());
    final journey = (result as Success<Journey>).value;
    expect(journey.id, const Id('journey-1'));
    expect(journey.title, 'Morning routine');
    expect(journey.description, 'A small daily rhythm for worship and discipline.');
    expect(journey.isStarted, isTrue);
  });
}
