part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final int code;

  LoginSuccess(this.code);
}

class LoginFailure extends LoginState {
  final String errMessaeg;

  LoginFailure(this.errMessaeg);
}
