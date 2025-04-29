part of 'get_reserved_spot_history_cubit.dart';

sealed class GetReservedSpotHistoryState extends Equatable {
  const GetReservedSpotHistoryState();

  @override
  List<Object> get props => [];
}

final class GetReservedSpotHistoryInitial extends GetReservedSpotHistoryState {}

final class GetReservedSpotHistoryLoading extends GetReservedSpotHistoryState {}

final class GetReservedSpotHistoryFailure extends GetReservedSpotHistoryState {
  final String errmessage;

  const GetReservedSpotHistoryFailure({required this.errmessage});
}

final class GetReservedSpotHistorySuccess extends GetReservedSpotHistoryState {
  final List<HistoryDataModal> history;

  const GetReservedSpotHistorySuccess({required this.history});
}
