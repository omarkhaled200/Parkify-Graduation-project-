import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Profile/Home/data/Model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';

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
}
