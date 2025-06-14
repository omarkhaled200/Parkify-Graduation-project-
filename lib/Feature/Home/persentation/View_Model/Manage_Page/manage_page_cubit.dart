import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ManagePageState { reserve, countdown, countup }

class ManagePageCubit extends Cubit<ManagePageState> {
  static const String _prefsKey = 'managepage';
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  ManagePageCubit() : super(ManagePageState.reserve);

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedState = prefs.getString(_prefsKey);
    final reservestate = stateToString(ManagePageState.reserve);
    print('📥 Loaded state from prefs: $savedState');
    if (savedState != null) {
      emit(_stringToState(savedState));
    } else {
      emit(_stringToState(reservestate));
    }
    _isInitialized = true;
  }

  Future<void> saveState(ManagePageState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, stateToString(state));
    print('The State ${state} saved Successfully');
  }

  Future<void> reserve() async {
    emit(ManagePageState.countdown);
    await saveState(ManagePageState.countdown);
  }

  Future<void> countdownFinished() async {
    print('⏰ countdownFinished called!');
    emit(ManagePageState.countup);
    await saveState(ManagePageState.countup);
    print('✅ State changed to countup and saved');
  }

  Future<void> cancel() async {
    emit(ManagePageState.reserve);
    await saveState(ManagePageState.reserve);
  }

  String stateToString(ManagePageState state) {
    switch (state) {
      case ManagePageState.reserve:
        return 'reserve';
      case ManagePageState.countdown:
        return 'countdown';
      case ManagePageState.countup:
        return 'countup';
    }
  }

  ManagePageState _stringToState(String value) {
    switch (value) {
      case 'countdown':
        return ManagePageState.countdown;
      case 'countup':
        return ManagePageState.countup;
      case 'reserve':
      default:
        return ManagePageState.reserve;
    }
  }
}
