import 'package:tazkiyah_core/core.dart';

final class Identity extends Entity<Id> {
  const Identity({required super.id, required this.displayName, required this.mission});

  final String displayName;
  final Mission mission;
}
