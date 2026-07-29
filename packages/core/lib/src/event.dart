abstract class DomainEvent {
  const DomainEvent({required this.occurredAt});

  final DateTime occurredAt;
}
