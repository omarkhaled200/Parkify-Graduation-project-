import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Model/reservation_model/reservation_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';

part 'reserve_spot_state.dart';

class ReserveSpotCubit extends Cubit<ReserveSpotState> {
  ReserveSpotCubit(this.homeRepo) : super(ReserveSpotInitial());
  final HomeRepo homeRepo;
  Future<void> reservespot({
    required String plate,
    required String reserve_at,
    required String token,
    required String id,
  }) async {
    emit(ReserveSpotLoading());
    var result = await homeRepo.reserveSpot(
        plate: plate, reserve_at: reserve_at, token: token, id: id);

    result.fold((Failure) {
      emit(ReserveSpotFailure(errmessage: Failure.errmessage));
    }, (reservespot) {
      emit(ReserveSpotSuccess(reserve: reservespot));
    });
  }
}
