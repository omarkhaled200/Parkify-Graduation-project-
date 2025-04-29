import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Profile/Home/data/Model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo.dart';

part 'get_reserved_spot_history_state.dart';

class GetReservedSpotHistoryCubit extends Cubit<GetReservedSpotHistoryState> {
  GetReservedSpotHistoryCubit(this.homeRepo)
      : super(GetReservedSpotHistoryInitial());
  final HomeRepo homeRepo;
  Future<void> GetREservedspot({required String token}) async {
    emit(GetReservedSpotHistoryLoading());
    var result = await homeRepo.getReservedSpotHistory(token: token);
    result.fold((Failure) {
      emit(GetReservedSpotHistoryFailure(errmessage: Failure.errmessage));
    }, (history) {
      emit(GetReservedSpotHistorySuccess(history: history));
    });
  }
}
