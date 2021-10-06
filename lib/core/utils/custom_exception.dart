class CustomException implements Exception {
  int errorCode = 0;
  String message = '';
  @override
  String toString() {
    return '{errorCode:$errorCode, message:$message}';
  }
}
