import 'package:test/test.dart';

import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

import '../lib/app_repository.dart';
import '../lib/app_state.dart';
import '../lib/local_persistence.dart';

void main() {
  test('repository saves and reloads state through local persistence', () {
    final repository = AppRepository(storage: LocalPersistence());

    final state = AppState(
      identity: Identity(
        id: const Id('identity-2'),
        displayName: 'Persistent User',
        mission: const Mission('Persist the real state.'),
      ),
      journey: Journey(
        id: const Id('journey-2'),
        title: 'Persisted journey',
        description: 'Testing the adapter layer',
        isStarted: true,
      ),
      knowledgeCard: const KnowledgeCard(
        id: Id('card-2'),
        title: 'Persistent knowledge',
        summary: 'Codec + persistence test',
      ),
      practice: Practice(
        id: const Id('practice-2'),
        title: 'Persistent practice',
        notes: 'Keep the seam narrow',
        isCompleted: true,
      ),
      reflection: Reflection(
        id: const Id('reflection-2'),
        summary: 'Persistence works',
        notes: 'Round-trip survived',
      ),
    );

    repository.save(state);
    final loaded = repository.loadOrCreate();

    expect(loaded.identity.id, state.identity.id);
    expect(loaded.identity.displayName, state.identity.displayName);
    expect(loaded.identity.mission.value, state.identity.mission.value);
    expect(loaded.journey.id, state.journey.id);
    expect(loaded.journey.title, state.journey.title);
    expect(loaded.knowledgeCard.id, state.knowledgeCard.id);
    expect(loaded.practice.id, state.practice.id);
    expect(loaded.practice.isCompleted, state.practice.isCompleted);
    expect(loaded.reflection.id, state.reflection.id);
    expect(loaded.reflection.summary, state.reflection.summary);
  });
}
