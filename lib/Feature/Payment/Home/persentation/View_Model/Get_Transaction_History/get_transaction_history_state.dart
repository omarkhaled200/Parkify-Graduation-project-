part of 'get_transaction_history_cubit.dart';

sealed class GetTransactionHistoryState extends Equatable {
  const GetTransactionHistoryState();

  @override
  List<Object> get props => [];
}

final class GetTransactionHistoryInitial extends GetTransactionHistoryState {}

final class GetTransactionHistoryLoading extends GetTransactionHistoryState {}

final class GetTransactionHistoryFailure extends GetTransactionHistoryState {
  final String errmessage;

  const GetTransactionHistoryFailure({required this.errmessage});
}

final class GetTransactionHistorySuccess extends GetTransactionHistoryState {
  final List<TransactionHistory> history;

  const GetTransactionHistorySuccess({required this.history});
}
