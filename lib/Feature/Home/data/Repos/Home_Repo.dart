import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Model/reservation_model/reservation_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ReservationModel>> reserveSpot({
    required String plate,
    required String reserve_at,
    required String token,
  });

  Future<Either<Failure, String>> cancelReservation({required String token});

  Future<Either<Failure, String>> deactivateReservationBlocker(
      {required String token});
}
