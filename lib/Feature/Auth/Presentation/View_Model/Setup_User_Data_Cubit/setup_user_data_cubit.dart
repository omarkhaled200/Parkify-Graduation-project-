import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'setup_user_data_state.dart';

class SetupUserDataCubit extends Cubit<SetupUserDataState> {
  SetupUserDataCubit(this.homeRepo) : super(SetupUserDataInitial());
  final HomeRepo homeRepo;
  Future<void> UserSetup(
      {required String National,
      required String Phone,
      required String plate,
      required String token}) async {
    emit(SetupUserDataLoading());
    var result = await homeRepo.postSetupUser(
        national: National, phone: Phone, plate: plate, token: token);
    result.fold((Failure) {
      emit(SetupUserDataFailure(Failure.errmessage));
    }, (user) {
      emit(SetupUserDataSuccess(user));
    });
  }
}
