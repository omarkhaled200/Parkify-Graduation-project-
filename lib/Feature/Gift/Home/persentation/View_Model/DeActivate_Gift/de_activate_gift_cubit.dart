import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Gift/Home/data/Repos/Home_Repo.dart';

part 'de_activate_gift_state.dart';

class DeActivateGiftCubit extends Cubit<DeActivateGiftState> {
  DeActivateGiftCubit(this.homeRepo) : super(DeActivateGiftInitial());
  final HomeRepo homeRepo;
  Future<void> deactivateGift(
      {required String token, required String id}) async {
    print(">>> DeactivateGift called with token: $token, id: $id");
    emit(DeActivateGifLoading());
    var result = await homeRepo.DeActviateGift(token: token, id: id);
    result.fold((Failure) {
      emit(DeActivateGifFailure(errmessage: Failure.errmessage));
    }, (message) {
      print("DeactivateGift called with id: $id");
      emit(DeActivateGifSuccess(message: message));
    });
  }
}
