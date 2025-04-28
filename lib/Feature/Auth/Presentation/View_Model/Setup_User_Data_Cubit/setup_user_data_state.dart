part of 'setup_user_data_cubit.dart';

sealed class SetupUserDataState extends Equatable {
  const SetupUserDataState();

  @override
  List<Object> get props => [];
}

final class SetupUserDataInitial extends SetupUserDataState {}

final class SetupUserDataLoading extends SetupUserDataState {}

final class SetupUserDataFailure extends SetupUserDataState {
  final String errmessage;

  SetupUserDataFailure(this.errmessage);
}

final class SetupUserDataSuccess extends SetupUserDataState {
  final UserModel user;

  SetupUserDataSuccess(this.user);
}
