import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';

part 'post_get_license_plate_state.dart';

class PostGetLicensePlateCubit extends Cubit<PostGetLicensePlateState> {
  PostGetLicensePlateCubit(this.homeRepo) : super(PostGetLicensePlateInitial());
  final prfileHomeRepo homeRepo;
  Future<void> postgetlicenseplate({required File image}) async {
    emit(PostGetLicensePlateLoading());
    var result = await homeRepo.postgetlicenseplate(image: image);
    result.fold((Failure) {
      emit(PostGetLicensePlateFailure(errmessage: Failure.errmessage));
    }, (plate) {
      emit(PostGetLicensePlateSuccess(plate: plate));
    });
  }
}
