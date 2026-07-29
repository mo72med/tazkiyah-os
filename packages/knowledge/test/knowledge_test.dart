import 'package:test/test.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_knowledge/knowledge.dart';

void main() {
  test('read knowledge card use case returns same card', () async {
    const card = KnowledgeCard(
      id: Id('card-1'),
      title: 'Sincerity',
      summary: 'Doing the right thing for the right reason.',
    );

    const useCase = ReadKnowledgeCardUseCase();
    final result = await useCase(const ReadKnowledgeCardInput(card: card));

    expect(result, isA<Success<KnowledgeCard>>());
    expect((result as Success<KnowledgeCard>).value, card);
  });
}
