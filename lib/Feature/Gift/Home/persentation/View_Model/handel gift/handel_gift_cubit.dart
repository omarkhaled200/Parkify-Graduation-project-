import 'package:bloc/bloc.dart';

part 'handel_gift_state.dart';

// Cubit
class GiftSelectionCubit extends Cubit<GiftSelectionState> {
  GiftSelectionCubit() : super(GiftSelectionInitial());

  int? _currentSelectedGiftId;

  int? get currentSelectedGiftId => _currentSelectedGiftId;

  void selectGift(int giftId) {
    _currentSelectedGiftId = giftId;
    emit(GiftSelected(giftId));
  }

  void deselectGift() {
    _currentSelectedGiftId = null;
    emit(NoGiftSelected());
  }

  bool isGiftSelected(int giftId) {
    return _currentSelectedGiftId == giftId;
  }

  bool get hasAnyGiftSelected => _currentSelectedGiftId != null;
}
