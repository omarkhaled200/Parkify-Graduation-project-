part of 'delet_user_plate_cubit.dart';

sealed class DeletUserPlateState extends Equatable {
  const DeletUserPlateState();

  @override
  List<Object> get props => [];
}

final class DeletUserPlateInitial extends DeletUserPlateState {}

final class DeletUserPlateLoading extends DeletUserPlateState {}

final class DeletUserPlateFailure extends DeletUserPlateState {
  final String errmessage;

  const DeletUserPlateFailure({required this.errmessage});
}

final class DeletUserPlateSuccess extends DeletUserPlateState {
  final String message;

  const DeletUserPlateSuccess(this.message);
}
