part of 'get_all_gifts_cubit.dart';

sealed class GetAllGiftsState extends Equatable {
  const GetAllGiftsState();

  @override
  List<Object> get props => [];
}

final class GetAllGiftsInitial extends GetAllGiftsState {}

final class GetAllGiftsLoading extends GetAllGiftsState {}

final class GetAllGiftsFailure extends GetAllGiftsState {
  final String errmessage;

  const GetAllGiftsFailure({required this.errmessage});
}

final class GetAllGiftsSuccess extends GetAllGiftsState {
  final List<GiftModel> gift;

  const GetAllGiftsSuccess({required this.gift});
}
