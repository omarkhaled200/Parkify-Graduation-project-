part of 'user_logout_account_cubit.dart';

sealed class UserLogoutAccountState extends Equatable {
  const UserLogoutAccountState();

  @override
  List<Object> get props => [];
}

final class UserLogoutAccountInitial extends UserLogoutAccountState {}

final class UserLogoutAccountLoading extends UserLogoutAccountState {}

final class UserLogoutAccountFailure extends UserLogoutAccountState {
  final String errmessage;

  UserLogoutAccountFailure(this.errmessage);
}

final class UserLogoutAccountSuccess extends UserLogoutAccountState {
  final String message;

  UserLogoutAccountSuccess(this.message);
}
