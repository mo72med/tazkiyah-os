import 'package:tazkiyah_core/core.dart';

final class KnowledgeCard extends Entity<Id> {
  const KnowledgeCard({required super.id, required this.title, required this.summary});

  final String title;
  final String summary;
}
