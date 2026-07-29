import 'package:tazkiyah_core/core.dart';

final class JourneyStarted extends DomainEvent {
  const JourneyStarted({required super.occurredAt, required this.journeyId});

  final Id journeyId;
}
