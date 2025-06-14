import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Profile/Home/data/History_model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);
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
      String message = data['success'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
