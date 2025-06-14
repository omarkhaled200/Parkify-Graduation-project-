part of 'get_activer_reservation_cubit.dart';

sealed class GetActiverReservationState extends Equatable {
  const GetActiverReservationState();

  @override
  List<Object> get props => [];
}

final class GetActiverReservationInitial extends GetActiverReservationState {}

final class GetActiverReservationLoading extends GetActiverReservationState {}

final class GetActiverReservationFailure extends GetActiverReservationState {
  final String errmessage;

  GetActiverReservationFailure({required this.errmessage});
}

final class GetActiverReservatioSuccess extends GetActiverReservationState {
  final ActiveReservtionModel reservation;

  GetActiverReservatioSuccess({required this.reservation});
}
