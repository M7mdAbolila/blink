import 'package:blink2/core/di/service_locator.dart';
import 'package:blink2/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_validate_state.dart';

class EmailValidateCubit extends Cubit<EmailValidateState> {
  EmailValidateCubit() : super(EmailValidateInitial());

  Future<void> emailvalidate({
    required String email,
    required String secretCode,
  }) async {
    var result = await getIt.get<SignUpRepoImpl>().emailValidate(
          email: email,
          secretCode: secretCode,
        );
    result.fold(
      (failure) => emit(
        EmailValidateFailure(failure.errMessage),
      ),
      (code) => emit(
        EmailValidateSuccess(code),
      ),
    );
  }
}
