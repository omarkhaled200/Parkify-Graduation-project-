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
      // الحالة 1: فيه success
      if (data.containsKey('success')) {
        String message = data['success'] ?? 'Success but no message';
        print(">>> DeactivateGift API response: ${message}");
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
  Future<Either<Failure, String>> ActviateGift({
    required String token,
    required String id,
  }) async {
    try {
      var data = await apiClass.post(
        endpoint: 'user/activateGift',
        token: token,
        body: {'gift_id': id},
      );

      print(">>> activateGift API response: $data");

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
}
