import 'package:equatable/equatable.dart';

class HistoryDataModal extends Equatable {
  final int? id;
  final String? licensePlate;
  final int? userId;
  final double? invoicePrice;
  final int? isPayed;
  final DateTime? enteredAt;
  final DateTime? exitedAt;

  const HistoryDataModal({
    this.id,
    this.licensePlate,
    this.userId,
    this.invoicePrice,
    this.isPayed,
    this.enteredAt,
    this.exitedAt,
  });

  factory HistoryDataModal.fromJson(Map<String, dynamic> json) {
    return HistoryDataModal(
      id: json['id'] as int?,
      licensePlate: json['license_plate'] as String?,
      userId: json['user_id'] as int?,
      invoicePrice: (json['invoice_price'] as num?)?.toDouble(),
      isPayed: json['is_payed'] as int?,
      enteredAt: json['entered_at'] == null
          ? null
          : DateTime.parse(json['entered_at'] as String),
      exitedAt: json['exited_at'] == null
          ? null
          : DateTime.parse(json['exited_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'license_plate': licensePlate,
        'user_id': userId,
        'invoice_price': invoicePrice,
        'is_payed': isPayed,
        'entered_at': enteredAt?.toIso8601String(),
        'exited_at': exitedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      licensePlate,
      userId,
      invoicePrice,
      isPayed,
      enteredAt,
      exitedAt,
    ];
  }
}
