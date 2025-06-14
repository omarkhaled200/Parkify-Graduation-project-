import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/spotdetialsmodel/spotdetialsmodel.dart';

part 'get_spot_detials_state.dart';

class GetSpotDetialsCubit extends Cubit<GetSpotDetialsState> {
  GetSpotDetialsCubit(this.homeRepo) : super(GetSpotDetialsInitial());
  final HomeRepo homeRepo;
  Future<void> getSpotDetials({required String token}) async {
    if (isClosed) return;
    emit(GetSpotDetialsLoading());

    var result = await homeRepo.GetSpotdetials(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetSpotDetialsFailure(errmessage: failure.errmessage));
      }
    }, (spot) {
      if (!isClosed) {
        emit(GetSpotDetialsSuccess(spot: spot));
      }
    });
  }
}
