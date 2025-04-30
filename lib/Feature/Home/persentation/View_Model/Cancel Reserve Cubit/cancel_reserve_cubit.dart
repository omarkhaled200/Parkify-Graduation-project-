import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Repos/Home_Repo.dart';

part 'cancel_reserve_state.dart';

class CancelReserveCubit extends Cubit<CancelReserveState> {
  CancelReserveCubit(this.homeRepo) : super(CancelReserveInitial());
  final HomeRepo homeRepo;
  Future<void> cancelReservation({
    required String token,
  }) async {
    emit(CancelReserveLoading());
    var result = await homeRepo.cancelReservation(token: token);

    result.fold((Failure) {
      emit(CancelReserveFailure(errmessage: Failure.errmessage));
    }, (reservespot) {
      emit(CancelReserveSuccess(reserve: reservespot));
    });
  }
}
