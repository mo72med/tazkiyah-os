import 'package:flutter/material.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';
import 'package:tazkiyah_journey/journey.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';
import 'package:tazkiyah_practice/practice.dart';
import 'package:tazkiyah_reflection/reflection.dart';

class TazkiyahApp extends StatelessWidget {
  const TazkiyahApp({super.key});

  @override
  Widget build(BuildContext context) {
    final identity = Identity(
      id: const Id('demo-identity'),
      displayName: 'Mohamed',
      mission: const Mission(
        'Build a life of worship, knowledge, and disciplined action.',
      ),
    );

    final journey = Journey(
      id: const Id('demo-journey'),
      title: 'Morning routine',
      description: 'A small daily rhythm for worship and discipline.',
      isStarted: true,
    );

    const knowledgeCard = KnowledgeCard(
      id: Id('demo-card'),
      title: 'Sincerity',
      summary: 'Doing the right thing for the right reason.',
    );

    final practice = Practice(
      id: const Id('demo-practice'),
      title: 'Read one knowledge card',
      notes: 'Keep it small and consistent.',
      isCompleted: false,
    );

    final reflection = Reflection(
      id: const Id('demo-reflection'),
      summary: 'I need to protect the first hour of the day.',
      notes: 'Morning focus is stronger than evening focus.',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tazkiyah OS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Tazkiyah OS')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionCard(
              title: 'Identity',
              lines: [
                'Name: ${identity.displayName}',
                'Mission: ${identity.mission.value}',
              ],
            ),
            _SectionCard(
              title: 'Journey',
              lines: [
                'Title: ${journey.title}',
                'Started: ${journey.isStarted}',
                'Description: ${journey.description}',
              ],
            ),
            _SectionCard(
              title: 'Knowledge',
              lines: [
                'Card: ${knowledgeCard.title}',
                'Summary: ${knowledgeCard.summary}',
              ],
            ),
            _SectionCard(
              title: 'Practice',
              lines: [
                'Title: ${practice.title}',
                'Completed: ${practice.isCompleted}',
                'Notes: ${practice.notes}',
              ],
            ),
            _SectionCard(
              title: 'Reflection',
              lines: [
                'Summary: ${reflection.summary}',
                'Notes: ${reflection.notes}',
              ],
            ),
          ],
        ),
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
