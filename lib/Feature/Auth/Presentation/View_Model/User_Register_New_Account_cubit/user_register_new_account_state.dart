part of 'user_register_new_account_cubit.dart';

sealed class UserRegisterNewAccountState extends Equatable {
  const UserRegisterNewAccountState();

  @override
  List<Object> get props => [];
}

final class UserRegisterNewAccountInitial extends UserRegisterNewAccountState {}

final class UserRegisterNewAccountLoading extends UserRegisterNewAccountState {}

final class UserRegisterNewAccountFailure extends UserRegisterNewAccountState {
  final String errmessage;

  UserRegisterNewAccountFailure(this.errmessage);
}

final class UserRegisterNewAccountSuccess extends UserRegisterNewAccountState {
  final UserData user;

  UserRegisterNewAccountSuccess(this.user);
}
