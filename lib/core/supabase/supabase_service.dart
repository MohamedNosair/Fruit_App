import 'package:fruit_app/core/supabase/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService implements DatabaseService {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
    required String documentId,
  }) async {
    await supabase.from(path).insert(data);
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      // var data = await firestore.collection(path).doc(documentId).get();
      var data = await supabase
          .from(path)
          .select('uId,name,email_address')
          .eq('uId', documentId)
          .single();
      return data;
    } else {
      // Query<Map<String, dynamic>> data = firestore.collection(path);
      PostgrestTransformBuilder<PostgrestList> data = supabase
          .from("products")
          .select();

      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.order(orderBy, ascending: descending);
          return data;
        } else if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      // var result = await data.get();
      // return result.docs.map((e) => e.data()).toList();

      return data;
    }
  }

  @override
  Future<bool> isUserExists({
    required String path,
    required String documentId,
  }) async {
    var doc = await supabase
        .from(path)
        .select('uId')
        .eq('uId', documentId)
        .maybeSingle();
    return doc == null;
  }
}
