part of 'get_user_plates_cubit.dart';

sealed class GetUserPlatesState extends Equatable {
  const GetUserPlatesState();

  @override
  List<Object> get props => [];
}

final class GetUserPlatesInitial extends GetUserPlatesState {}

final class GetUserPlatesLoading extends GetUserPlatesState {}

final class GetUserPlatesFailure extends GetUserPlatesState {
  final String errmessage;

  const GetUserPlatesFailure(this.errmessage);
}

final class GetUserPlatesSuccess extends GetUserPlatesState {
  final List<PlateModel> plate;

  const GetUserPlatesSuccess(this.plate);
}
