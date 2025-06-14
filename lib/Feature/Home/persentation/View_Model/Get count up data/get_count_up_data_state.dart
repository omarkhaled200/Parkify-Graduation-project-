part of 'get_count_up_data_cubit.dart';

sealed class GetCountUpDataState extends Equatable {
  const GetCountUpDataState();

  @override
  List<Object> get props => [];
}

final class GetCountUpDataInitial extends GetCountUpDataState {}

final class GetCountUpDataLoading extends GetCountUpDataState {}

final class GetCountUpDataFailure extends GetCountUpDataState {
  final String errmessage;

  GetCountUpDataFailure({required this.errmessage});
}

final class GetCountUpDataSuccess extends GetCountUpDataState {
  final CountupModel countupdata;

  GetCountUpDataSuccess({required this.countupdata});
}
