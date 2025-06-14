import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/transaction_history/transaction_history.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo.dart';

part 'get_transaction_history_state.dart';

class GetTransactionHistoryCubit extends Cubit<GetTransactionHistoryState> {
  GetTransactionHistoryCubit(this.homeRepo)
      : super(GetTransactionHistoryInitial());
  final HomeRepo homeRepo;
  Future<void> getTransactionHistory({required String token}) async {
    emit(GetTransactionHistoryLoading());

    var result = await homeRepo.getTransaction(token: token);
    result.fold(
      (failure) {
        emit(GetTransactionHistoryFailure(errmessage: failure.errmessage));
      },
      (history) {
        print('the data from Cubit is ${history}');
        emit(GetTransactionHistorySuccess(history: history));
      },
    );
  }
}
