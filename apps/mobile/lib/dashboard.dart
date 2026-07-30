import 'package:flutter/material.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot = DashboardSnapshot.demo();

    return Scaffold(
      appBar: AppBar(title: const Text('Tazkiyah OS')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionCard(
            title: 'Identity',
            lines: [
              'Name: ${snapshot.identity.displayName}',
              'Mission: ${snapshot.identity.mission.value}',
            ],
          ),
          _SectionCard(
            title: 'Journey',
            lines: [
              'Title: ${snapshot.journey.title}',
              'Started: ${snapshot.journey.isStarted}',
              'Description: ${snapshot.journey.description}',
            ],
          ),
          _SectionCard(
            title: 'Knowledge',
            lines: [
              'Card: ${snapshot.knowledgeCard.title}',
              'Summary: ${snapshot.knowledgeCard.summary}',
            ],
          ),
          _SectionCard(
            title: 'Practice',
            lines: [
              'Title: ${snapshot.practice.title}',
              'Completed: ${snapshot.practice.isCompleted}',
              'Notes: ${snapshot.practice.notes}',
            ],
          ),
          _SectionCard(
            title: 'Reflection',
            lines: [
              'Summary: ${snapshot.reflection.summary}',
              'Notes: ${snapshot.reflection.notes}',
            ],
          ),
        ],
      ),
    );
  }
}

final class DashboardSnapshot {
  const DashboardSnapshot({
    required this.identity,
    required this.journey,
    required this.knowledgeCard,
    required this.practice,
    required this.reflection,
  });

  factory DashboardSnapshot.demo() {
    return DashboardSnapshot(
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

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.lines});

  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...lines.map((line) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(line),
                )),
          ],
        ),
      ),
    );
  }
}
