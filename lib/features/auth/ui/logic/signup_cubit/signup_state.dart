part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class togglePasswordVisibilityState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final UserEntities userEntities;

  SignupSuccessState({required this.userEntities});
}

final class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState({required this.message});
}
