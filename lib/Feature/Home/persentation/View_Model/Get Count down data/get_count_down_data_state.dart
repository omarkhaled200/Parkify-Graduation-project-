part of 'get_count_down_data_cubit.dart';

sealed class GetCountDownDataState extends Equatable {
  const GetCountDownDataState();

  @override
  List<Object> get props => [];
}

final class GetCountDownDataInitial extends GetCountDownDataState {}

final class GetCountDownDataLoading extends GetCountDownDataState {}

final class GetCountDownDataFailure extends GetCountDownDataState {
  final String errmessage;

  GetCountDownDataFailure({required this.errmessage});
}

final class GetCountDownDataSuccess extends GetCountDownDataState {
  final CountdownModel countdowndata;

  GetCountDownDataSuccess({required this.countdowndata});
}
