abstract class Faliure {
  final String message;

  Faliure({required this.message});
}

class ServerFaluire extends Faliure {
  ServerFaluire({required super.message});
}
