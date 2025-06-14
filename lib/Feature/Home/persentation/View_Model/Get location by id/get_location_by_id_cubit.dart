import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';

part 'get_location_by_id_state.dart';

class GetLocationByIdCubit extends Cubit<GetLocationByIdState> {
  GetLocationByIdCubit(this.homeRepo) : super(GetLocationByIdInitial());
  final HomeRepo homeRepo;
  Future<void> getlocationbyid({required String token, required int id}) async {
    if (isClosed) return;
    emit(GetLocationByIdLoading());

    var result = await homeRepo.getlocationbyid(token: token, id: id);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetLocationByIdFailure(errmessage: failure.errmessage));
      }
    }, (loc) {
      if (!isClosed) {
        emit(GetLocationByIdSuccess(location: loc));
      }
    });
  }
}
