import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/Token_Functions.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_data/user.dart';
import 'package:parkify/Feature/Auth/data/Models/user_data/user_data.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;
  HomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, UserModel>> postLogin(
      {required String email, required String password}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/login', body: {'email': email, 'password': password});

      // تحقق إذا كانت البيانات ليست null وأيضاً من نوع Map<String, dynamic>
      if (data != null && data is Map<String, dynamic>) {
        if (data.containsKey('token') && data.containsKey('userData')) {
          String token = data['token'];
          await saveToken(token);
          UserModel user = UserModel.fromJson(data['userData']);
          return right(user);
        } else {
          return left(ServerFailure('Missing token or user data in response'));
        }
      } else {
        return left(ServerFailure('Invalid response from server or null data'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> postRegister(
      {required String Name,
      required String Email,
      required String password,
      required String ConfirmPassword}) async {
    try {
      var data = await apiClass.post(endpoint: 'user/register', body: {
        'name': Name,
        'email': Email,
        'password': password,
        'password_confirmation': ConfirmPassword
      });
      UserModel? user;
      try {
        user = UserModel.fromJson(data);
        print(user);
      } catch (e) {
        print("Error parsing JSON: $e");
      }
      return right(user!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> postSetupUser(
      {required String national,
      required String phone,
      required String plate,
      required String token}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/setupUser',
          body: {
            'national': national,
            'phone': phone,
            'plate': plate,
          },
          token: token);

      UserModel user;
      user = UserModel.fromJson(data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> postlogout() async {
    try {
      var response = await apiClass.post(
        endpoint: 'user/logout',
        body: {}, // أو ابعته null لو مش محتاج body أصلا
      );

      // ناخد الماسدج من الريسبونس
      String message = response['message'];

      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
