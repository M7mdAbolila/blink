part of 'user_validate_cubit.dart';

@immutable
class UserValidateState {}

final class UserValidateInitial extends UserValidateState {}



class UserValidateSuccess extends UserValidateState {
  final int code;
  UserValidateSuccess(this.code);
}

class UserValidateFailure extends UserValidateState {
  final String errMessage;
  UserValidateFailure(this.errMessage);
}
