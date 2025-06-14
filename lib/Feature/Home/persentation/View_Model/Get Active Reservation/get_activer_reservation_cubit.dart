import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/active_reservtion_model/active_reservtion_model.dart';

part 'get_activer_reservation_state.dart';

class GetActiverReservationCubit extends Cubit<GetActiverReservationState> {
  GetActiverReservationCubit(this.homeRepo)
      : super(GetActiverReservationInitial());
  final HomeRepo homeRepo;
  Future<void> GetActiveReservation({required String token}) async {
    if (isClosed) return;
    emit(GetActiverReservationLoading());

    var result = await homeRepo.GetActiveReservation(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetActiverReservationFailure(errmessage: failure.errmessage));
      }
    }, (reservation) {
      if (!isClosed) {
        emit(GetActiverReservatioSuccess(reservation: reservation));
      }
    });
  }
}
