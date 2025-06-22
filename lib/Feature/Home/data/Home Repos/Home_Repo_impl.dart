import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';
import 'package:parkify/Feature/Home/data/Model/active_reservtion_model/active_reservtion_model.dart';
import 'package:parkify/Feature/Home/data/Model/countdown_model.dart';
import 'package:parkify/Feature/Home/data/Model/countup_model.dart';
import 'package:parkify/Feature/Home/data/Model/reservation_model/reservation_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/spotdetialsmodel/spotdetialsmodel.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, List<LocationModel>>> GetAllLocations(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getAllLocations', token: token);
      List<LocationModel> loc = [];
      for (var item in data['success']) {
        loc.add(LocationModel.fromJson(item));
      }

      return right(loc);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> cancelReservation(
      {required String token}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/cancelReservation', token: token, body: null);
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
  Future<Either<Failure, String>> deactivateReservationBlocker(
      {required String token, required String location}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/deactivateReservationBlocker',
          token: token,
          body: {'location': location});
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
  Future<Either<Failure, ReservationModel>> reserveSpot({
    required String plate,
    required String reserve_at,
    required String token,
    required String id,
  }) async {
    try {
      var data = await apiClass.post(endpoint: 'user/reserveSpot', body: {
        'plate': plate,
        'reserve_at': reserve_at,
        'token': token,
        'location_id': id,
      });
      ReservationModel? user;
      try {
        user = ReservationModel.fromJson(data);
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
  Future<Either<Failure, List<Spotdetialsmodel>>> GetSpotdetials(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getSpotDetails', token: token);
      List<Spotdetialsmodel> spot = [];
      for (var item in data['success']) {
        spot.add(Spotdetialsmodel.fromJson(item));
      }
      return right(spot);
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
  Future<Either<Failure, ActiveReservtionModel>> GetActiveReservation(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getActiveReservation', token: token);
      ActiveReservtionModel reservation =
          ActiveReservtionModel.fromJson(data['success']);

      return right(reservation);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CountdownModel>> getCountDowndata(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getActiveReservation/countdown', token: token);
      CountdownModel countdowndata = CountdownModel.fromJson(data['success']);

      return right(countdowndata);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CountupModel>> getCountUpdata(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getActiveReservation/countup', token: token);
      CountupModel countupdata = CountupModel.fromJson(data['success']);

      return right(countupdata);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocationModel>> getlocationbyid(
      {required String token, required int id}) async {
    try {
      var data = await apiClass.get(endpoint: 'getLocation/$id', token: token);
      LocationModel countupdata = LocationModel.fromJson(data['location']);

      return right(countupdata);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
