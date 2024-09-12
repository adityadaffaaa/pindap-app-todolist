class ApiException implements Exception {
  final dynamic _message;

  ApiException([
    this._message,
  ]);

  @override
  String toString() => '$_message';
}

class NetworkException extends ApiException {
  NetworkException([
    String super.message = 'Not internet connection',
  ]);
}

class OtherException extends ApiException {
  OtherException([
    super.message,
  ]);
}
