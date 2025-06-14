import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/payment_model.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/transaction_history/transaction_history.dart';

abstract class HomeRepo {
  Future<Either<Failure, PaymentModel>> Postpayment(
      {required String method, required String amount, required String token});
  Future<Either<Failure, List<TransactionHistory>>> getTransaction(
      {required String token});
}
