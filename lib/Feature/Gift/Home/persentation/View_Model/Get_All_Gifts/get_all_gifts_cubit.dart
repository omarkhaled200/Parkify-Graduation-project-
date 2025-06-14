import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Gift/Home/data/Repos/Home_Repo.dart';
import 'package:parkify/Feature/Gift/Home/data/gift_model/gift_model.dart';

part 'get_all_gifts_state.dart';

class GetAllGiftsCubit extends Cubit<GetAllGiftsState> {
  GetAllGiftsCubit(this.homeRepo) : super(GetAllGiftsInitial());
  final HomeRepo homeRepo;
  Future<void> getAllGift({required String token}) async {
    emit(GetAllGiftsLoading());
    var result = await homeRepo.GetAllGift(token: token);
    result.fold((Failure) {
      emit(GetAllGiftsFailure(errmessage: Failure.errmessage));
    }, (gift) {
      emit(GetAllGiftsSuccess(gift: gift));
    });
  }
}
