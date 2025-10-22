class ExceptionCustom implements Exception{
  final String message;

  ExceptionCustom({required this.message});
   

@override
  String toString() {
    return message;
  }
}
