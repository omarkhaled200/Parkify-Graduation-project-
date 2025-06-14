import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Gift/Home/data/Repos/Home_Repo.dart';
import 'package:parkify/Feature/Gift/Home/data/gift_model/gift_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, List<GiftModel>>> GetAllGift(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getAllGifts', token: token);
      List<GiftModel> gift = [];
      for (var item in data['success']) {
        gift.add(GiftModel.fromJson(item));
      }
      return right(gift);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> DeActviateGift(
      {required String token, required String id}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/deactivateGift', token: token, body: {'gift_id': id});
      String message = data['success'];
      print(">>> DeactivateGift API response: ${message}");
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> ActviateGift(
      {required String token, required String id}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'user/activateGift', token: token, body: {'gift_id': id});
      String message = data['success'];
      print(">>> activateGift API response: ${message}");
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
