import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'post_add_license_plate_state.dart';

class PostAddLicensePlateCubit extends Cubit<PostAddLicensePlateState> {
  PostAddLicensePlateCubit(this.homeRepo) : super(PostAddLicensePlateInitial());
  final AuthHomeRepo homeRepo;
  Future<void> UserLogin({required String plate, required String token}) async {
    emit(PostAddLicensePlateLoading());
    var result = await homeRepo.postaddlicenseplate(plate: plate, token: token);
    result.fold((Failure) {
      emit(PostAddLicensePlateFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(PostAddLicensePlateSuccess(message: msg));
    });
  }
}
