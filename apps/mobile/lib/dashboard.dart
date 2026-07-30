import 'package:flutter/material.dart';

import 'app_state.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final snapshot = AppState.demo();

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
