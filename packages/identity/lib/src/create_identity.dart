import 'package:tazkiyah_core/core.dart';

import 'identity.dart';
import 'mission.dart';

final class CreateIdentityInput {
  const CreateIdentityInput({required this.id, required this.displayName, required this.mission});

  final Id id;
  final String displayName;
  final Mission mission;
}

final class CreateIdentityUseCase extends UseCase<Identity, CreateIdentityInput> {
  const CreateIdentityUseCase();

  @override
  Future<Result<Identity>> call(CreateIdentityInput input) async {
    final identity = Identity(
      id: input.id,
      displayName: input.displayName,
      mission: input.mission,
    );

    return Result.success(identity);
  }
}
