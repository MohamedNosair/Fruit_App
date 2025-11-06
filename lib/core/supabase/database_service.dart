abstract class DatabaseService {
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
     required String documentId,
  });

  Future<dynamic> getData({
    required String path,
     String? documentId,
     Map<String, dynamic>? query,
  });


  Future<bool> isUserExists({
    required String path,
    required String documentId,
  });
}
