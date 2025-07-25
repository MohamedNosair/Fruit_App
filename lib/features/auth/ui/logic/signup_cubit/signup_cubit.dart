import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
    String name,
    password,
    emailAddress,
  ) async {
    emit(SignupLoadingState());
    final result = await authRepo.createEmialAndPassword(
      emailAddress,
      password,
      name,
    );
    result.fold(
      (faluire) {
        emit(SignupErrorState(message: faluire.message));
      },
      (userEntitie) {
        emit(SignupSuccessState(userEntities: userEntitie));
      },
    );
  }

  bool obscureText = false;
  togglePasswordVisibility() {
    obscureText = !obscureText;
    emit(togglePasswordVisibilityState());
  }

  //  bool isTermsAccepted = false;
  // toggleTermsAccepted() {
  //   isTermsAccepted = !isTermsAccepted;
  //   emit(toggleTermsAcceptedState());
   
  // }
}
