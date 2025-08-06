import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_app/core/firebase/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
  
  @override
  Future<bool> isUserExists({required String path, required String documentId}) async {
    var doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
