import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final bool? success;
  final String? paymentUrl;
  final String? paymentToken;
  final String? iframeId;

  const PaymentModel({
    this.success,
    this.paymentUrl,
    this.paymentToken,
    this.iframeId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        success: json['success'] as bool?,
        paymentUrl: json['payment_url'] as String?,
        paymentToken: json['payment_token'] as String?,
        iframeId: json['iframe_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'payment_url': paymentUrl,
        'payment_token': paymentToken,
        'iframe_id': iframeId,
      };

  @override
  List<Object?> get props {
    return [
      success,
      paymentUrl,
      paymentToken,
      iframeId,
    ];
  }
}
