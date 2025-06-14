import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/countup_model.dart';

part 'get_count_up_data_state.dart';

class GetCountUpDataCubit extends Cubit<GetCountUpDataState> {
  GetCountUpDataCubit(this.homeRepo) : super(GetCountUpDataInitial());
  final HomeRepo homeRepo;
  Future<void> getCountUpdata({required String token}) async {
    if (isClosed) return;
    emit(GetCountUpDataLoading());

    var result = await homeRepo.getCountUpdata(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetCountUpDataFailure(errmessage: failure.errmessage));
      }
    }, (countupdata) {
      if (!isClosed) {
        emit(GetCountUpDataSuccess(countupdata: countupdata));
      }
    });
  }
}
