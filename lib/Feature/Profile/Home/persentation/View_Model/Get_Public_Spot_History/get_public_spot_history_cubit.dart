import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:parkify/Feature/Profile/Home/data/History_model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';

part 'get_public_spot_history_state.dart';

class GetPublicSpotHistoryCubit extends Cubit<GetPublicSpotHistoryState> {
  GetPublicSpotHistoryCubit(this.homeRepo)
      : super(GetPublicSpotHistoryInitial());
  final prfileHomeRepo homeRepo;
  Future<void> GetPublicspot({required String token}) async {
    emit(GetPublicSpotHistoryLoading());
    var result = await homeRepo.getPublicSpotHistory(token: token);
    result.fold((Failure) {
      emit(GetPublicSpotHistoryFailure(errmessage: Failure.errmessage));
    }, (history) {
      emit(GetPublicSpotHistorySuccess(history: history));
    });
  }
}
