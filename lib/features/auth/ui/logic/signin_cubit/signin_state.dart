part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class togglePasswordVisibilityState extends SigninState {}
final class SigninLoadingState extends SigninState {}

final class SigninSuccessState extends SigninState {
  final UserEntities userEntities;

  SigninSuccessState({required this.userEntities});
}

final class SigninErrorState extends SigninState {
  final String message;

  SigninErrorState({required this.message});
}
