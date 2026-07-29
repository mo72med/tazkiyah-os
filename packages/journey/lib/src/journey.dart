import 'package:tazkiyah_core/core.dart';

final class Journey extends Entity<Id> {
  const Journey({
    required super.id,
    required this.title,
    this.description = '',
    this.isStarted = false,
  });

  final String title;
  final String description;
  final bool isStarted;

  Journey copyWith({String? title, String? description, bool? isStarted}) {
    return Journey(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isStarted: isStarted ?? this.isStarted,
    );
  }
}
