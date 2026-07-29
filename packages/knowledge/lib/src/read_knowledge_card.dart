import 'package:tazkiyah_core/core.dart';

import 'knowledge_card.dart';

final class ReadKnowledgeCardInput {
  const ReadKnowledgeCardInput({required this.card});

  final KnowledgeCard card;
}

final class ReadKnowledgeCardUseCase extends UseCase<KnowledgeCard, ReadKnowledgeCardInput> {
  const ReadKnowledgeCardUseCase();

  @override
  Future<Result<KnowledgeCard>> call(ReadKnowledgeCardInput input) async {
    return Result.success(input.card);
  }
}
