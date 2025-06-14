import 'package:equatable/equatable.dart';

class HistoryDataModal extends Equatable {
  final int? id;
  final String? licensePlate;
  final String? spotcode;
  final int? userId;
  final double? invoicePrice;
  final int? isPayed;
  final String? enteredAt;
  final String? exitedAt;

  const HistoryDataModal({
    this.spotcode,
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
      spotcode: json['spot_code'] as String?,
      userId: json['user_id'] as int?,
      invoicePrice: (json['invoice_price'] as num?)?.toDouble(),
      isPayed: json['is_payed'] as int?,
      enteredAt:
          json['entered_at'] == null ? null : json['entered_at'] as String?,
      exitedAt: json['exited_at'] == null ? null : json['exited_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'license_plate': licensePlate,
        'spot_code': spotcode,
        'user_id': userId,
        'invoice_price': invoicePrice,
        'is_payed': isPayed,
        'entered_at': enteredAt,
        'exited_at': exitedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      licensePlate,
      spotcode,
      userId,
      invoicePrice,
      isPayed,
      enteredAt,
      exitedAt,
    ];
  }
}
