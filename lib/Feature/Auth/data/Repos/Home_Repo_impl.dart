import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Auth/data/Models/user_data/user_data.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

class HomeRepoImpl extends HomeRepo{
  @override
  Future<Either<Failure, List<UserData>>> postLogin() {
    // TODO: implement postLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserData>>> postRegister() {
    // TODO: implement postRegister
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserData>>> postSetupUser() {
    // TODO: implement postSetupUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserData>>> postlogout() {
    // TODO: implement postlogout
    throw UnimplementedError();
  }
}