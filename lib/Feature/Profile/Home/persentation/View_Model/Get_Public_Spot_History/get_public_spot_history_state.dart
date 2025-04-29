part of 'get_public_spot_history_cubit.dart';

sealed class GetPublicSpotHistoryState extends Equatable {
  const GetPublicSpotHistoryState();

  @override
  List<Object> get props => [];
}

final class GetPublicSpotHistoryInitial extends GetPublicSpotHistoryState {}

final class GetPublicSpotHistoryLoading extends GetPublicSpotHistoryState {}

final class GetPublicSpotHistoryFailure extends GetPublicSpotHistoryState {
  final String errmessage;

  const GetPublicSpotHistoryFailure({required this.errmessage});
}

final class GetPublicSpotHistorySuccess extends GetPublicSpotHistoryState {
  final List<HistoryDataModal> history;

  const GetPublicSpotHistorySuccess({required this.history});
}
