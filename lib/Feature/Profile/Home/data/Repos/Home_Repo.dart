import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Profile/Home/data/Model/history_data_modal/history_data_modal.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HistoryDataModal>>> getReservedSpotHistory(
      {required String token});
  Future<Either<Failure, List<HistoryDataModal>>> getPublicSpotHistory(
      {required String token});
}
