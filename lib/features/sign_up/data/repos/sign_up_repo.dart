import 'package:blink2/core/networking/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Failure, int>> userValidate({
    required String email,
    required String username,
    required String phone,
  });
  Future<Either<Failure, int>> validateAnEmail({
    required String email,
    required int secretCode,
  });
  Future<Either<Failure, int>> signUp({
    required String email,
    required String password,
    required String username,
    required String phone,
    required DateTime dob,
  });
}
