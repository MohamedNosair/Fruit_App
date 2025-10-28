
import 'package:fruit_app/core/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class  SupabaseInit {
  static late Supabase supabase;

  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  }
