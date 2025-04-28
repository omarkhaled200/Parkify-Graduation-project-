part of 'post_payment_cubit.dart';

sealed class PostPaymentState extends Equatable {
  const PostPaymentState();

  @override
  List<Object> get props => [];
}

final class PostPaymentInitial extends PostPaymentState {}

final class PostPaymentLoading extends PostPaymentState {}

final class PostPaymentFailure extends PostPaymentState {
  final String errmessage;

  PostPaymentFailure({required this.errmessage});
}

final class PostPaymentSuccess extends PostPaymentState {
  final PaymentModel payment;

  PostPaymentSuccess({required this.payment});
}
