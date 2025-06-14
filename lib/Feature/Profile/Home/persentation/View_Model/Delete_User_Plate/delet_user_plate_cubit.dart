import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';

part 'delet_user_plate_state.dart';

class DeletUserPlateCubit extends Cubit<DeletUserPlateState> {
  DeletUserPlateCubit(this.homeRepo) : super(DeletUserPlateInitial());
  final HomeRepo homeRepo;
  Future<void> deleteuserplate({
    required String id,
    required String token,
  }) async {
    emit(DeletUserPlateLoading());
    var result = await homeRepo.deleteUserPlate(token: token, id: id);

    result.fold((Failure) {
      emit(DeletUserPlateFailure(errmessage: Failure.errmessage));
    }, (reservespot) {
      emit(DeletUserPlateSuccess(reservespot));
    });
  }
}
