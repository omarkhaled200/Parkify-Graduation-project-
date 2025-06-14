import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/countdown_model.dart';

part 'get_count_down_data_state.dart';

class GetCountDownDataCubit extends Cubit<GetCountDownDataState> {
  GetCountDownDataCubit(this.homeRepo) : super(GetCountDownDataInitial());
  final HomeRepo homeRepo;
  Future<void> getCountDowndata({required String token}) async {
    if (isClosed) return;
    emit(GetCountDownDataLoading());

    var result = await homeRepo.getCountDowndata(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetCountDownDataFailure(errmessage: failure.errmessage));
      }
    }, (countdowndata) {
      if (!isClosed) {
        emit(GetCountDownDataSuccess(countdowndata: countdowndata));
      }
    });
  }
}
