import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Gift/Home/data/Repos/Home_Repo.dart';

part 'activate_gift_state.dart';

class ActivateGiftCubit extends Cubit<ActivateGiftState> {
  ActivateGiftCubit(this.homeRepo) : super(ActivateGiftInitial());
  final HomeRepo homeRepo;
  Future<void> activateGift({required String token, required String id}) async {
    print(">>> activateGift called with token: $token, id: $id");
    emit(ActivateGiftLoading());
    var result = await homeRepo.ActviateGift(token: token, id: id);
    result.fold((Failure) {
      print(
          ">>> ActivateGiftCubit: failure with error = ${Failure.errmessage}");
      emit(ActivateGiftFailure(errmessage: Failure.errmessage));
    }, (message) {
      print(">>> ActivateGiftCubit: success with message = $message");
      emit(ActivateGiftSuccess(message: message));
    });
  }
}
