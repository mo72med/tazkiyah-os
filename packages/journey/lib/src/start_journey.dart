import 'package:tazkiyah_core/core.dart';

import 'journey.dart';
import 'journey_started.dart';

final class StartJourneyInput {
  const StartJourneyInput({required this.id, required this.title, this.description = ''});

  final Id id;
  final String title;
  final String description;
}

final class StartJourneyUseCase extends UseCase<Journey, StartJourneyInput> {
  const StartJourneyUseCase();

  @override
  Future<Result<Journey>> call(StartJourneyInput input) async {
    final journey = Journey(
      id: input.id,
      title: input.title,
      description: input.description,
      isStarted: true,
    );

    return Result.success(journey);
  }
}
