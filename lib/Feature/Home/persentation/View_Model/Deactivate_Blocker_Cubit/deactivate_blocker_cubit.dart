import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
part 'deactivate_blocker_state.dart';

class DeactivateBlockerCubit extends Cubit<DeactivateBlockerState> {
  DeactivateBlockerCubit(this.homeRepo) : super(DeactivateBlockerInitial());
  final HomeRepo homeRepo;
  Future<void> deactivateReservationBlocker({
    required String token,
    required String location,
  }) async {
    emit(DeactivateBlockerLoading());
    var result = await homeRepo.deactivateReservationBlocker(
        token: token, location: location);

    result.fold((Failure) {
      emit(DeactivateBlockerFailure(errmessage: Failure.errmessage));
    }, (output) {
      emit(DeactivateBlockerSuccess(output: output));
    });
  }
}
