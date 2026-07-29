import 'package:tazkiyah_core/core.dart';

final class PracticeCompleted extends DomainEvent {
  const PracticeCompleted({required super.occurredAt, required this.practiceId});

  final Id practiceId;
}
