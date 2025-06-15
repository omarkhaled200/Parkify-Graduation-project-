import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';

part 'get_user_plates_state.dart';

class GetUserPlatesCubit extends Cubit<GetUserPlatesState> {
  GetUserPlatesCubit(this.homeRepo) : super(GetUserPlatesInitial());
  final prfileHomeRepo homeRepo;
  Future<void> getuserplate({required String token}) async {
    emit(GetUserPlatesLoading());
    var result = await homeRepo.getUserPlate(token: token);
    result.fold((Failure) {
      emit(GetUserPlatesFailure(Failure.errmessage));
    }, (plate) {
      emit(GetUserPlatesSuccess(plate));
    });
  }
}
