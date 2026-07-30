import 'package:test/test.dart';

import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

import '../lib/app_repository.dart';
import '../lib/app_state.dart';
import '../lib/local_storage.dart';

void main() {
  test('loads demo state when storage is empty', () {
    final repository = AppRepository(storage: LocalStorage());

    final state = repository.loadOrCreate();

    expect(state.identity.displayName, 'Mohamed');
    expect(state.journey.title, 'Morning routine');
    expect(state.knowledgeCard.title, 'Sincerity');
    expect(state.practice.title, 'Read one knowledge card');
    expect(state.reflection.summary, 'I need to protect the first hour of the day.');
  });

  test('saves and loads state through local storage seam', () {
    final storage = LocalStorage();
    final repository = AppRepository(storage: storage);

    final customState = AppState(
      identity: Identity(
        id: const Id('id-1'),
        displayName: 'Test User',
        mission: const Mission('Test mission'),
      ),
      journey: Journey(
        id: const Id('journey-1'),
        title: 'Test journey',
        description: 'Testing persistence seam',
        isStarted: true,
      ),
      knowledgeCard: const KnowledgeCard(
        id: Id('card-1'),
        title: 'Test card',
        summary: 'Testing knowledge storage',
      ),
      practice: Practice(
        id: const Id('practice-1'),
        title: 'Test practice',
        notes: 'Testing practice storage',
        isCompleted: true,
      ),
      reflection: Reflection(
        id: const Id('reflection-1'),
        summary: 'Test reflection',
        notes: 'Testing reflection storage',
      ),
    );

    repository.save(customState);
    final loaded = repository.loadOrCreate();

    expect(loaded.identity.displayName, 'Test User');
    expect(loaded.journey.title, 'Test journey');
    expect(loaded.knowledgeCard.title, 'Test card');
    expect(loaded.practice.isCompleted, isTrue);
    expect(loaded.reflection.summary, 'Test reflection');
  });
}
