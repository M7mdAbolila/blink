import 'package:blink2/core/networking/api_service.dart';
import 'package:blink2/features/login/data/repos/login_repo.dart';
import 'package:blink2/features/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepo>(
    LoginRepo(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SignUpRepoImpl>(
    SignUpRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
