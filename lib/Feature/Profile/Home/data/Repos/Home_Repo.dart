import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:parkify/Core/errors/failure.dart';
import 'package:parkify/Feature/Profile/Home/data/History_model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';

abstract class prfileHomeRepo {
  Future<Either<Failure, List<HistoryDataModal>>> getReservedSpotHistory(
      {required String token});
  Future<Either<Failure, List<HistoryDataModal>>> getPublicSpotHistory(
      {required String token});
  Future<Either<Failure, List<PlateModel>>> getUserPlate(
      {required String token});
  Future<Either<Failure, String>> deleteUserPlate(
      {required String token, required String id});
  Future<Either<Failure, String>> postgetlicenseplate({required File image});
  Future<Either<Failure, String>> postaddlicenseplate(
      {required String plate, required String token});
}
