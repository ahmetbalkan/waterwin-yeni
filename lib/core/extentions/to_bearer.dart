extension BearerTokenExtension on String {
  String toBearer() => 'Bearer $this';
}
