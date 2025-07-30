import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/auth/domain/entities/user_entities.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repos.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
    final AuthRepo authRepo;

    bool obscureText = false;
  togglePasswordVisibility() {
    obscureText = !obscureText;
    emit(togglePasswordVisibilityState());
  }


  Future<void> signinWithEmailAndPassword(
    
    password,
    emailAddress,
  ) async {
    emit(SigninLoadingState());
    final result = await authRepo.signinEmialAndPassword(
      emailAddress,
      password,
     
    );
    result.fold(
      (faluire) {
        emit(SigninErrorState(message: faluire.message));
      },
      (userEntitie) {
        emit(SigninSuccessState(userEntities: userEntitie));
      },
    );
  }
  
  Future<void> signinWithGoogle() async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithGoogle();
    result.fold(
      (faluire) {
        emit(SigninErrorState(message: faluire.message));
      },
      (userEntitie) {
        emit(SigninSuccessState(userEntities: userEntitie));
      },
    );
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithFacebook();
    result.fold(
      (faluire) {
        emit(SigninErrorState(message: faluire.message));
      },
      (userEntitie) {
        emit(SigninSuccessState(userEntities: userEntitie));
      },
    );
  }


}
