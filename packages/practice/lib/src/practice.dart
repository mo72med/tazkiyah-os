import 'package:tazkiyah_core/core.dart';

final class Practice extends Entity<Id> {
  const Practice({
    required super.id,
    required this.title,
    this.notes = '',
    this.isCompleted = false,
  });

  final String title;
  final String notes;
  final bool isCompleted;

  Practice copyWith({String? title, String? notes, bool? isCompleted}) {
    return Practice(
      id: id,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
