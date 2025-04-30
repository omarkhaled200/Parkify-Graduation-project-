part of 'reserve_spot_cubit.dart';

sealed class ReserveSpotState extends Equatable {
  const ReserveSpotState();

  @override
  List<Object> get props => [];
}

final class ReserveSpotInitial extends ReserveSpotState {}

final class ReserveSpotLoading extends ReserveSpotState {}

final class ReserveSpotFailure extends ReserveSpotState {
  final String errmessage;

  const ReserveSpotFailure({required this.errmessage});
}

final class ReserveSpotSuccess extends ReserveSpotState {
  final ReservationModel reserve;

  const ReserveSpotSuccess({required this.reserve});
}
