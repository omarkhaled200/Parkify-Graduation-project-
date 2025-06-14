import 'package:dartz/dartz.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/balanceand_point_model.dart';
import 'package:parkify/Core/errors/failure.dart';

abstract class UserBalancePointHomeRepo {
  Future<Either<Failure, BalanceandPointModel>> getBalanceandPoint(
      {required String token});
}
