import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_validate_state.dart';

class UserValidateCubit extends Cubit<UserValidateState> {
  UserValidateCubit() : super(UserValidateInitial());

  Future<void> userValidate({
    required String email,
    required String username,
    required String phone,
  }) async {
    var result = await getIt.get<SignUpRepoImpl>().userValidate(
          email: email,
          username: username,
          phone: phone,
        );
    result.fold(
      (failure) => emit(
        UserValidateFailure(failure.errMessage),
      ),
      (code) => emit(
        UserValidateSuccess(code),
      ),
    );
  }
}
