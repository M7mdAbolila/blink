part of 'add_user_cubit.dart';

@immutable
class AddUserState {}

final class AddUserInitial extends AddUserState {}

class AddUserSuccess extends AddUserState {
  final int code;

  AddUserSuccess(this.code);
}

class AddUserFailure extends AddUserState {
  final String errMessage;

  AddUserFailure(this.errMessage);
}
