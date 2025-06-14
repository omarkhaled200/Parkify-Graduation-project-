import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Gift/Home/data/gift_model/gift_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<GiftModel>>> GetAllGift({required String token});
  Future<Either<Failure, String>> ActviateGift(
      {required String token, required String id});
  Future<Either<Failure, String>> DeActviateGift(
      {required String token, required String id});
}
