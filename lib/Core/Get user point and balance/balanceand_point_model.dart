import 'package:equatable/equatable.dart';

class BalanceandPointModel extends Equatable {
  final double? balance;
  final double? points;

  const BalanceandPointModel({this.balance, this.points});

  factory BalanceandPointModel.fromJson(Map<String, dynamic> json) {
    return BalanceandPointModel(
      balance: (json['balance'] as num?)?.toDouble(),
      points: (json['points'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'balance': balance,
        'points': points,
      };

  @override
  List<Object?> get props => [balance, points];
}
