import 'package:tazkiyah_core/core.dart';

final class IdentityCreated extends DomainEvent {
  const IdentityCreated({required super.occurredAt, required this.identityId});

  final Id identityId;
}
