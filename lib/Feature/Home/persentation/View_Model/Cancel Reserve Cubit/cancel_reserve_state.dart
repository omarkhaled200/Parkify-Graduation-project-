part of 'cancel_reserve_cubit.dart';

sealed class CancelReserveState extends Equatable {
  const CancelReserveState();

  @override
  List<Object> get props => [];
}

final class CancelReserveInitial extends CancelReserveState {}

final class CancelReserveLoading extends CancelReserveState {}

final class CancelReserveFailure extends CancelReserveState {
  final String errmessage;

  const CancelReserveFailure({required this.errmessage});
}

final class CancelReserveSuccess extends CancelReserveState {
  final String reserve;

  const CancelReserveSuccess({required this.reserve});
}
