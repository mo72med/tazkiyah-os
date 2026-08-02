import 'app_state.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

/// Simple JSON-like codec for AppState.
///
/// This is the seam that lets the application move from in-memory state to a
/// persistable representation without changing the higher layers first. The
/// implementation is intentionally plain Dart so we can swap the backing store
/// later without extra dependencies.
final class AppStateCodec {
  const AppStateCodec();

  Map<String, Object?> encode(AppState state) {
    return {
      'identity': {
        'id': state.identity.id.value,
        'displayName': state.identity.displayName,
        'mission': state.identity.mission.value,
      },
      'journey': {
        'id': state.journey.id.value,
        'title': state.journey.title,
        'description': state.journey.description,
        'isStarted': state.journey.isStarted,
      },
      'knowledgeCard': {
        'id': state.knowledgeCard.id.value,
        'title': state.knowledgeCard.title,
        'summary': state.knowledgeCard.summary,
      },
      'practice': {
        'id': state.practice.id.value,
        'title': state.practice.title,
        'notes': state.practice.notes,
        'isCompleted': state.practice.isCompleted,
      },
      'reflection': {
        'id': state.reflection.id.value,
        'summary': state.reflection.summary,
        'notes': state.reflection.notes,
      },
    };
  }

  AppState decode(Map<String, Object?> json) {
    final identity = json['identity'] as Map<String, Object?>;
    final journey = json['journey'] as Map<String, Object?>;
    final knowledgeCard = json['knowledgeCard'] as Map<String, Object?>;
    final practice = json['practice'] as Map<String, Object?>;
    final reflection = json['reflection'] as Map<String, Object?>;

    return AppState(
      identity: Identity(
        id: Id(identity['id'] as String),
        displayName: identity['displayName'] as String,
        mission: Mission(identity['mission'] as String),
      ),
      journey: Journey(
        id: Id(journey['id'] as String),
        title: journey['title'] as String,
        description: journey['description'] as String,
        isStarted: journey['isStarted'] as bool,
      ),
      knowledgeCard: KnowledgeCard(
        id: Id(knowledgeCard['id'] as String),
        title: knowledgeCard['title'] as String,
        summary: knowledgeCard['summary'] as String,
      ),
      practice: Practice(
        id: Id(practice['id'] as String),
        title: practice['title'] as String,
        notes: practice['notes'] as String,
        isCompleted: practice['isCompleted'] as bool,
      ),
      reflection: Reflection(
        id: Id(reflection['id'] as String),
        summary: reflection['summary'] as String,
        notes: reflection['notes'] as String,
      ),
    );
  }
}
