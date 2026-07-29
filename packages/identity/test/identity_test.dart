import 'package:test/test.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';

void main() {
  test('create identity use case returns created identity', () async {
    const useCase = CreateIdentityUseCase();
    final result = await useCase(
      const CreateIdentityInput(
        id: Id('identity-1'),
        displayName: 'Mohamed',
        mission: Mission('Serve Allah with knowledge and discipline.'),
      ),
    );

    expect(result, isA<Success<Identity>>());
    final identity = (result as Success<Identity>).value;
    expect(identity.id, const Id('identity-1'));
    expect(identity.displayName, 'Mohamed');
    expect(identity.mission.value, 'Serve Allah with knowledge and discipline.');
  });
}
