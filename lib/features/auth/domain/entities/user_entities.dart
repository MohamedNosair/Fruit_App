class UserEntities {
  final String name, emailAddress, uId;
  final String? imageUrl;

  UserEntities({
    this.imageUrl,
    required this.name,
    required this.emailAddress,
    required this.uId,
  });
}
