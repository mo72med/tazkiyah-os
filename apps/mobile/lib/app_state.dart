import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

final class AppState {
  const AppState({
    required this.identity,
    required this.journey,
    required this.knowledgeCard,
    required this.practice,
    required this.reflection,
  });

  factory AppState.demo() {
    return AppState(
      identity: Identity(
        id: const Id('demo-identity'),
        displayName: 'Mohamed',
        mission: const Mission(
          'Build a life of worship, knowledge, and disciplined action.',
        ),
      ),
      journey: Journey(
        id: const Id('demo-journey'),
        title: 'Morning routine',
        description: 'A small daily rhythm for worship and discipline.',
        isStarted: true,
      ),
      knowledgeCard: const KnowledgeCard(
        id: Id('demo-card'),
        title: 'Sincerity',
        summary: 'Doing the right thing for the right reason.',
      ),
      practice: Practice(
        id: const Id('demo-practice'),
        title: 'Read one knowledge card',
        notes: 'Keep it small and consistent.',
        isCompleted: false,
      ),
      reflection: Reflection(
        id: const Id('demo-reflection'),
        summary: 'I need to protect the first hour of the day.',
        notes: 'Morning focus is stronger than evening focus.',
      ),
    );
  }

  final Identity identity;
  final Journey journey;
  final KnowledgeCard knowledgeCard;
  final Practice practice;
  final Reflection reflection;
}
