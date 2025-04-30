import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Home/data/Model/reservation_model/reservation_model.dart';
import 'package:parkify/Feature/Home/data/Repos/Home_Repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, String>> cancelReservation(
      {required String token}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/cancelReservation', token: token, body: null);

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deactivateReservationBlocker(
      {required String token}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/deactivateReservationBlocker',
          token: token,
          body: null);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReservationModel>> reserveSpot(
      {required String plate,
      required String reserve_at,
      required String token}) async {
    try {
      var data = await apiClass.post(endpoint: 'user/reserveSpot', body: {
        'plate': plate,
        'reserve_at': reserve_at,
        'token': token,
      });
      ReservationModel? user;
      try {
        user = ReservationModel.fromJson(data);
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
}
