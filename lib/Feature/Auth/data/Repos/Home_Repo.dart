import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Auth/data/Models/user_data/user_data.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserData>>> postLogin();
  Future<Either<Failure, List<UserData>>> postRegister();
  Future<Either<Failure, List<UserData>>> postSetupUser();
  Future<Either<Failure, List<UserData>>> postlogout();
}
