import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Core/utlis/Token_Functions.dart';

import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'user_logout_account_state.dart';

class UserLogoutAccountCubit extends Cubit<UserLogoutAccountState> {
  UserLogoutAccountCubit(this.homeRepo) : super(UserLogoutAccountInitial());
  final HomeRepo homeRepo;
  Future<void> logout() async {
    emit(UserLogoutAccountLoading()); // حالة تحميل لو بتحب تعمل لودينج

    final result = await homeRepo.postlogout();

    result.fold(
      (failure) {
        emit(UserLogoutAccountFailure(failure.errmessage));
      },
      (message) async {
        await deleteToken(); // مسح التوكن
        emit(UserLogoutAccountSuccess(message)); // نجح اللوج آوت
      },
    );
  }
}
