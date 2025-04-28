import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/payment_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PaymentModel>> Postpayment(
      {required String method, required String amount, required String token});
}
