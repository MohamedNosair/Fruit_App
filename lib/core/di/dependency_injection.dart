import 'package:fruit_app/core/supabase/database_service.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/core/supabase/supabase_service.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/repo/product_repo_impl.dart';
import 'package:fruit_app/core/supabase/auth_services.dart';
import 'package:fruit_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupGetIt() {
  // sl.registerSingleton<FirbaseAuthService>(FirbaseAuthService());
  sl.registerSingleton<AuthSupabaseServices>(AuthSupabaseServices());
  sl.registerSingleton<DatabaseService>(SupabaseService());
 

  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      // firbaseAuthService: sl<FirbaseAuthService>(),
      databaseService: sl<DatabaseService>(),
      authSupabaseServices: sl<AuthSupabaseServices>(),
    ),
  );

  sl.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: sl<DatabaseService>()),
  );
}
