import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/Token_Functions.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:path/path.dart';

import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

class AuthHomeRepoImpl extends AuthHomeRepo {
  final ApiClass apiClass;
  AuthHomeRepoImpl(this.apiClass);
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
          UserModel user = UserModel.fromJson(data);
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
  Future<Either<Failure, String>> postlogout({required String token}) async {
    try {
      var data =
          await apiClass.post(endpoint: 'user/logout', body: {}, token: token);

      // الحالة 1: فيه success
      if (data.containsKey('success')) {
        String message = data['success'] ?? 'Success but no message';
        return right(message);
      }

      // الحالة 2: فيه error
      if (data.containsKey('error')) {
        String errorMessage = data['error'] ?? 'Unknown error';
        return left(ServerFailure(errorMessage));
      }

      // الحالة 3: فيه message (بس مش success)
      if (data.containsKey('message')) {
        String message = data['message'] ?? 'Unknown message';
        return right(message);
      }

      // الحالة 4: مفيش حاجة مفهومة
      return left(ServerFailure('Unexpected API response'));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> postaddlicenseplate(
      {required String plate, required String token}) async {
    try {
      var response = await apiClass.post(
        endpoint: 'user/addLicensePlate',
        body: {'plate': plate},
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

  @override
  Future<Either<Failure, String>> postgetlicenseplate(
      {required File image}) async {
    try {
      Dio dio = Dio();

      String fileName = basename(image.path);
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      });

      Response response = await dio.post(
        "https://74f7-41-45-2-219.ngrok-free.app/extract-text/",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        print("added successfully");
        print(response.data);
        return Right(response.data['plate'].toString());
      } else {
        print("Error: ${response.statusCode}");
        print(response.data);
        return Right(response.data.toString());
      }
    } catch (e) {
      print("Upload failed: $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
