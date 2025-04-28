import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Auth/data/Models/user_data/user_data.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserModel>> postLogin(
      {required String email, required String password});

  Future<Either<Failure, UserModel>> postRegister(
      {required String Name,
      required String Email,
      required String password,
      required String ConfirmPassword});

  Future<Either<Failure, UserModel>> postSetupUser(
      {required String national,
      required String phone,
      required String plate,
      required String token});

  Future<Either<Failure, String>> postlogout();
}
