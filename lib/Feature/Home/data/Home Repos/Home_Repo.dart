import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Home/data/Model/active_reservtion_model/active_reservtion_model.dart';
import 'package:parkify/Feature/Home/data/Model/countdown_model.dart';
import 'package:parkify/Feature/Home/data/Model/countup_model.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';
import 'package:parkify/Feature/Home/data/Model/reservation_model/reservation_model.dart';
import 'package:parkify/Feature/Home/data/Model/spotdetialsmodel/spotdetialsmodel.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ReservationModel>> reserveSpot({
    required String plate,
    required String reserve_at,
    required String token,
    required String id,
  });

  Future<Either<Failure, String>> cancelReservation({required String token});

  Future<Either<Failure, String>> deactivateReservationBlocker(
      {required String token, required String location});
  Future<Either<Failure, List<LocationModel>>> GetAllLocations(
      {required String token});
  Future<Either<Failure, ActiveReservtionModel>> GetActiveReservation(
      {required String token});
  Future<Either<Failure, LocationModel>> getlocationbyid(
      {required String token, required int id});
  Future<Either<Failure, CountdownModel>> getCountDowndata(
      {required String token});
  Future<Either<Failure, CountupModel>> getCountUpdata({required String token});
  Future<Either<Failure, List<Spotdetialsmodel>>> GetSpotdetials(
      {required String token});
  Future<Either<Failure, List<PlateModel>>> getUserPlate(
      {required String token});
}
