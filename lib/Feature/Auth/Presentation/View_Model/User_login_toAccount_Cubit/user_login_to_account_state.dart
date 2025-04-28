part of 'user_login_to_account_cubit.dart';

sealed class UserLoginToAccountState extends Equatable {
  const UserLoginToAccountState();

  @override
  List<Object> get props => [];
}

final class UserLoginToAccountInitial extends UserLoginToAccountState {}

final class UserLoginToAccountLoading extends UserLoginToAccountState {}

final class UserLoginToAccountFailure extends UserLoginToAccountState {
  final String errmessage;

  UserLoginToAccountFailure(this.errmessage);
}

final class UserLoginToAccounSuccess extends UserLoginToAccountState {
  final UserModel user;

  UserLoginToAccounSuccess(this.user);
}
