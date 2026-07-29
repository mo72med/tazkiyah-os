import 'package:tazkiyah_core/core.dart';

final class Reflection extends Entity<Id> {
  const Reflection({required super.id, required this.summary, this.notes = ''});

  final String summary;
  final String notes;
}
