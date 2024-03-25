part of 'email_validate_cubit.dart';

@immutable
class EmailValidateState {}

final class EmailValidateInitial extends EmailValidateState {}

class EmailValidateSuccess extends EmailValidateState {
  final int code;

  EmailValidateSuccess(this.code);
}

class EmailValidateFailure extends EmailValidateState {
  final String errMessage;

  EmailValidateFailure(this.errMessage);
}
