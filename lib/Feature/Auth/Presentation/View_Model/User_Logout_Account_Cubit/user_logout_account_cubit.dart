import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Core/utlis/Token_Functions.dart';

import 'package:parkify/Feature/Auth/data/Repos/Home_Repo.dart';

part 'user_logout_account_state.dart';

class UserLogoutAccountCubit extends Cubit<UserLogoutAccountState> {
  UserLogoutAccountCubit(this.homeRepo) : super(UserLogoutAccountInitial());
  final AuthHomeRepo homeRepo;
  Future<void> logout({required String token}) async {
    emit(UserLogoutAccountLoading()); // حالة تحميل لو بتحب تعمل لودينج

    final result = await homeRepo.postlogout(token: token);

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
