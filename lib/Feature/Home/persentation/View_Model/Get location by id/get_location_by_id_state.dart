part of 'get_location_by_id_cubit.dart';

sealed class GetLocationByIdState extends Equatable {
  const GetLocationByIdState();

  @override
  List<Object> get props => [];
}

final class GetLocationByIdInitial extends GetLocationByIdState {}

final class GetLocationByIdLoading extends GetLocationByIdState {}

final class GetLocationByIdFailure extends GetLocationByIdState {
  final String errmessage;

  GetLocationByIdFailure({required this.errmessage});
}

final class GetLocationByIdSuccess extends GetLocationByIdState {
  final LocationModel location;

  GetLocationByIdSuccess({required this.location});
}
