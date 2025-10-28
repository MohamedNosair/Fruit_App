import 'package:fruit_app/core/firebase/database_service.dart';
import 'package:fruit_app/core/firebase/firbase_service.dart';
import 'package:fruit_app/core/firebase/firestore_service.dart';
import 'package:fruit_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirbaseAuthService>(FirbaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firbaseAuthService: getIt<FirbaseAuthService>(),
     databaseService: getIt<DatabaseService>()));
}
