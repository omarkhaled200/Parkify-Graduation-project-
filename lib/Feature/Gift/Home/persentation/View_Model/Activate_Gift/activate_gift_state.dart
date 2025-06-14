part of 'activate_gift_cubit.dart';

sealed class ActivateGiftState extends Equatable {
  const ActivateGiftState();

  @override
  List<Object> get props => [];
}

final class ActivateGiftInitial extends ActivateGiftState {}

final class ActivateGiftLoading extends ActivateGiftState {}

final class ActivateGiftFailure extends ActivateGiftState {
  final String errmessage;

  const ActivateGiftFailure({required this.errmessage});
}

final class ActivateGiftSuccess extends ActivateGiftState {
  final String message;

  const ActivateGiftSuccess({required this.message});
}
