import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/payment_model.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/transaction_history/transaction_history.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, PaymentModel>> Postpayment(
      {required String method,
      required String amount,
      required String token}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'initiatePayment',
          body: {'method': method, 'amount': amount},
          token: token);
      PaymentModel? payment;
      try {
        payment = PaymentModel.fromJson(data);
      } catch (e) {
        print("Error parsing JSON: $e");
      }
      return right(payment!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionHistory>>> getTransaction(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getTransactionHistory', token: token);
      List<TransactionHistory> history = [];
      try {
        for (var item in data['success']) {
          history.add(TransactionHistory.fromJson(item));
        }
      } catch (e) {
        print("Error parsing JSON: $e");
      }
      print('the data from Home Repo is ${history}');
      return right(history);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
