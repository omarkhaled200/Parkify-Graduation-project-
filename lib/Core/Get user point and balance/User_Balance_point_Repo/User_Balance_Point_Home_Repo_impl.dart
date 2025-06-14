import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_point_Home_Repo.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/balanceand_point_model.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';

class UserBalancePointHomeRepoImpl extends UserBalancePointHomeRepo {
  final ApiClass apiClass;

  UserBalancePointHomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, BalanceandPointModel>> getBalanceandPoint(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'user/getPointsAndBalance', token: token);
      BalanceandPointModel value =
          BalanceandPointModel.fromJson(data['userData']);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
