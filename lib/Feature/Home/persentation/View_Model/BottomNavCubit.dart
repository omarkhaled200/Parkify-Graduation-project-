import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // يبدأ من أول Tab (Home)

  void setPage(int newIndex) {
    emit(newIndex);
  }
}
