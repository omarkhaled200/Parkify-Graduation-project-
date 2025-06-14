part of 'user_balance_point_cubit.dart';

sealed class UserBalancePointState extends Equatable {
  const UserBalancePointState();

  @override
  List<Object> get props => [];
}

final class UserBalancePointInitial extends UserBalancePointState {}

final class UserBalancePointLoading extends UserBalancePointState {}

final class UserBalancePointFailure extends UserBalancePointState {
  final String errmessage;

  const UserBalancePointFailure({required this.errmessage});
}

final class UserBalancePointSuccess extends UserBalancePointState {
  final BalanceandPointModel value;

  const UserBalancePointSuccess({required this.value});
}
