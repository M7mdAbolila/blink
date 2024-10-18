import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/features/login/data/repos/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await getIt.get<LoginRepo>().login(
          email: email,
          password: password,
        );

    result.fold(
      (failure) => emit(
        LoginFailure(failure.errMessage),
      ),
      (code) => emit(
        LoginSuccess(code),
      ),
    );
  }
}
