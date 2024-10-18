import 'package:blink2/core/networking/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Failure, dynamic>> userValidate({
    required String email,
    required String username,
    required String phone,
  });
  Future<Either<Failure, dynamic>> emailValidate({
    required String email,
    required String secretCode,
  });
  Future<Either<Failure, dynamic>> addUser({
    required String email,
    required String password,
    required String username,
    required String phone,
    required DateTime dob,
  });
}
