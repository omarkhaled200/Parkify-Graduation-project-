import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'user_login_to_account_state.dart';

class UserLoginToAccountCubit extends Cubit<UserLoginToAccountState> {
  UserLoginToAccountCubit(this.homeRepo) : super(UserLoginToAccountInitial());
  final HomeRepo homeRepo;
  Future<void> UserLogin(
      {required String email, required String password}) async {
    emit(UserLoginToAccountLoading());
    var result = await homeRepo.postLogin(email: email, password: password);
    result.fold((Failure) {
      emit(UserLoginToAccountFailure(Failure.errmessage));
    }, (user) {
      emit(UserLoginToAccounSuccess(user));
    });
  }
}
