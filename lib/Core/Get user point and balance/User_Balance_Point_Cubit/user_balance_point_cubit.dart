import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_point_Home_Repo.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/balanceand_point_model.dart';

part 'user_balance_point_state.dart';

class UserBalancePointCubit extends Cubit<UserBalancePointState> {
  UserBalancePointCubit(this.homeRepo) : super(UserBalancePointInitial());
  final UserBalancePointHomeRepo homeRepo;
  Future<void> getbalanceandpoints({required String token}) async {
    emit(UserBalancePointLoading());
    var result = await homeRepo.getBalanceandPoint(token: token);
    result.fold((Failure) {
      emit(UserBalancePointFailure(errmessage: Failure.errmessage));
    }, (value) {
      emit(UserBalancePointSuccess(value: value));
    });
  }
}
