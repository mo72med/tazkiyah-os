final class Failure {
  const Failure({required this.code, required this.message, this.details});

  final String code;
  final String message;
  final String? details;

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}
