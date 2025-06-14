import 'package:equatable/equatable.dart';

class TransactionHistory extends Equatable {
  final String? status;
  final String? message;
  final String? completedAt;

  const TransactionHistory({this.status, this.message, this.completedAt});

  factory TransactionHistory.fromJson(Map<String, dynamic> json) {
    return TransactionHistory(
      status: json['status'] as String?,
      message: json['message'] as String?,
      completedAt: json['completed_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'completed_at': completedAt,
      };

  @override
  List<Object?> get props => [status, message, completedAt];
}
