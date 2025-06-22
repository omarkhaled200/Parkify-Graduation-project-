import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Profile/Home/data/History_model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';
import 'package:path/path.dart';

class profileHomeRepoImpl extends prfileHomeRepo {
  final ApiClass apiClass;

  profileHomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, List<HistoryDataModal>>> getPublicSpotHistory(
      {required String token}) async {
    try {
      var data =
          await apiClass.get(endpoint: 'user/getPublicSpotLog', token: token);
      List<HistoryDataModal> history = [];
      for (var item in data) {
        history.add(HistoryDataModal.fromJson(item));
      }
      return right(history);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HistoryDataModal>>> getReservedSpotHistory(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getReservableSpotLog', token: token);
      List<HistoryDataModal> history = [];
      for (var item in data) {
        history.add(HistoryDataModal.fromJson(item));
      }
      return right(history);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlateModel>>> getUserPlate(
      {required String token}) async {
    try {
      var data =
          await apiClass.get(endpoint: 'user/getUserPlates', token: token);
      List<PlateModel> plate = [];
      for (var item in data['success']) {
        plate.add(PlateModel.fromJson(item));
      }
      return right(plate);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUserPlate(
      {required String token, required String id}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/deleteLicensePlate', token: token, body: {'id': id});
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
        String errorMessage = data['message'] ?? 'Unknown message';
        return left(ServerFailure(errorMessage));
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
      var data = await apiClass.post(
        endpoint: 'user/addLicensePlate',
        body: {'plate': plate},
      );

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
        String errorMessage = data['message'] ?? 'Unknown message';
        return left(ServerFailure(errorMessage));
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
        "https://53b5-156-205-61-135.ngrok-free.app/extract-text/",
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
