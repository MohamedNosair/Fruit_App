abstract class DatabaseService {
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
     required String documentId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });
  Future<bool> isUserExists({
    required String path,
    required String documentId,
  });
}
