import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
  Future<void> addUser({
    required String email,
    required String password,
    required String username,
    required String phone,
    required DateTime dob,
  }) async {
    var result = await getIt.get<SignUpRepoImpl>().addUser(
          email: email,
          password: password,
          username: username,
          phone: phone,
          dob: dob,
        );
    result.fold(
      (failure) => emit(
        AddUserFailure(failure.errMessage),
      ),
      (code) => emit(
        AddUserSuccess(code),
      ),
    );
  }
}
