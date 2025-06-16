part of 'handel_gift_cubit.dart';

abstract class GiftSelectionState {}

class GiftSelectionInitial extends GiftSelectionState {}

class GiftSelected extends GiftSelectionState {
  final int giftId;
  GiftSelected(this.giftId);
}

class NoGiftSelected extends GiftSelectionState {}
