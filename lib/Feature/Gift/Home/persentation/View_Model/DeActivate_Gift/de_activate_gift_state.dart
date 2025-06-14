part of 'de_activate_gift_cubit.dart';

sealed class DeActivateGiftState extends Equatable {
  const DeActivateGiftState();

  @override
  List<Object> get props => [];
}

final class DeActivateGiftInitial extends DeActivateGiftState {}

final class DeActivateGifLoading extends DeActivateGiftState {}

final class DeActivateGifFailure extends DeActivateGiftState {
  final String errmessage;

  const DeActivateGifFailure({required this.errmessage});
}

final class DeActivateGifSuccess extends DeActivateGiftState {
  final String message;

  const DeActivateGifSuccess({required this.message});
}
