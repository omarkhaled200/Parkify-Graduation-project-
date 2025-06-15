import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

abstract class AuthHomeRepo {
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
  Future<Either<Failure, String>> postgetlicenseplate({required File image});
  Future<Either<Failure, String>> postaddlicenseplate(
      {required String plate, required String token});

  Future<Either<Failure, String>> postlogout({required String token});
}
