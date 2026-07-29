import 'package:tazkiyah_core/core.dart';

final class ReflectionRecorded extends DomainEvent {
  const ReflectionRecorded({required super.occurredAt, required this.reflectionId});

  final Id reflectionId;
}
