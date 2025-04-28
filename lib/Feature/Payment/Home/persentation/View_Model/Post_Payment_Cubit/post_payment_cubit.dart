import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/payment_model.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo.dart';

part 'post_payment_state.dart';

class PostPaymentCubit extends Cubit<PostPaymentState> {
  PostPaymentCubit(this.homeRepo) : super(PostPaymentInitial());
  final HomeRepo homeRepo;

  Future<void> Postpayment({
    required String method,
    required String amount,
    required String token,
  }) async {
    // التحقق من أن الـ Cubit لم يُغلق قبل إرسال أي حالة
    if (isClosed) return;
    emit(PostPaymentLoading());

    try {
      var result = await homeRepo.Postpayment(
        method: method,
        amount: amount,
        token: token,
      );

      // التحقق مرة أخرى قبل إرسال النتيجة
      if (isClosed) return;

      result.fold(
        (failure) {
          if (!isClosed)
            emit(PostPaymentFailure(errmessage: failure.errmessage));
        },
        (payment) {
          // print('The payment URL is: ${payment.paymentUrl}');
          if (!isClosed) emit(PostPaymentSuccess(payment: payment));
        },
      );
    } catch (e) {
      // معالجة أي أخطاء غير متوقعة
      if (!isClosed) emit(PostPaymentFailure(errmessage: 'حدث خطأ غير متوقع'));
    }
  }
}
