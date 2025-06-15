import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'user_register_new_account_state.dart';

class UserRegisterNewAccountCubit extends Cubit<UserRegisterNewAccountState> {
  UserRegisterNewAccountCubit(this.homeRepo)
      : super(UserRegisterNewAccountInitial());
  final AuthHomeRepo homeRepo;
  Future<void> UserRegister(
      {required String email,
      required String password,
      required String name,
      required String confirmpassword}) async {
    emit(UserRegisterNewAccountLoading());
    var result = await homeRepo.postRegister(
        Name: name,
        Email: email,
        password: password,
        ConfirmPassword: confirmpassword);
    result.fold((Failure) {
      emit(UserRegisterNewAccountFailure(Failure.errmessage));
    }, (user) {
      emit(UserRegisterNewAccountSuccess(user: user));
    });
  }
}
