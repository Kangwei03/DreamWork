
class CustomException implements Exception{
  final _message;

  CustomException(this._message);

  @override
  String toString(){
    return "$_message";
  }
}

class GenericException extends CustomException{
  GenericException([String? message])
    : super(message);
}
