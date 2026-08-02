import 'package:test/test.dart';

import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

import '../lib/app_state.dart';
import '../lib/app_state_codec.dart';

void main() {
  test('encodes and decodes AppState symmetrically', () {
    const codec = AppStateCodec();

    final state = AppState(
      identity: Identity(
        id: const Id('identity-1'),
        displayName: 'Test User',
        mission: const Mission('Build and persist a clear system.'),
      ),
      journey: Journey(
        id: const Id('journey-1'),
        title: 'Testing journey',
        description: 'A journey for codec verification',
        isStarted: true,
      ),
      knowledgeCard: const KnowledgeCard(
        id: Id('card-1'),
        title: 'Testing knowledge',
        summary: 'Codec round-trip test',
      ),
      practice: Practice(
        id: const Id('practice-1'),
        title: 'Testing practice',
        notes: 'Persist this state',
        isCompleted: true,
      ),
      reflection: Reflection(
        id: const Id('reflection-1'),
        summary: 'Codec works',
        notes: 'Round-trip preserved all fields',
      ),
    );

    final encoded = codec.encode(state);
    final decoded = codec.decode(encoded);

    expect(decoded.identity.id, state.identity.id);
    expect(decoded.identity.displayName, state.identity.displayName);
    expect(decoded.identity.mission.value, state.identity.mission.value);
    expect(decoded.journey.id, state.journey.id);
    expect(decoded.journey.title, state.journey.title);
    expect(decoded.journey.description, state.journey.description);
    expect(decoded.journey.isStarted, state.journey.isStarted);
    expect(decoded.knowledgeCard.id, state.knowledgeCard.id);
    expect(decoded.knowledgeCard.title, state.knowledgeCard.title);
    expect(decoded.knowledgeCard.summary, state.knowledgeCard.summary);
    expect(decoded.practice.id, state.practice.id);
    expect(decoded.practice.title, state.practice.title);
    expect(decoded.practice.notes, state.practice.notes);
    expect(decoded.practice.isCompleted, state.practice.isCompleted);
    expect(decoded.reflection.id, state.reflection.id);
    expect(decoded.reflection.summary, state.reflection.summary);
    expect(decoded.reflection.notes, state.reflection.notes);
  });
}
