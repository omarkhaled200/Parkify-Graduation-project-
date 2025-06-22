import 'package:equatable/equatable.dart';

import '../active_reservtion_model/reservable_spot.dart';

class ReservationModel extends Equatable {
  final int? id;
  final String? licensePlate;
  final DateTime? expectedArrival;
  final int? isActive;
  final int? reservableSpotId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ReservableSpot? reservableSpot;

  const ReservationModel({
    this.id,
    this.licensePlate,
    this.expectedArrival,
    this.isActive,
    this.reservableSpotId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.reservableSpot,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'] as int?,
      licensePlate: json['license_plate'] as String?,
      expectedArrival: json['expected_arrival'] == null
          ? null
          : DateTime.parse(json['expected_arrival'] as String),
      isActive: json['is_active'] as int?,
      reservableSpotId: json['reservable_spot_id'] as int?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      reservableSpot: json['reservable_spot'] == null
          ? null
          : ReservableSpot.fromJson(
              json['reservable_spot'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'license_plate': licensePlate,
        'expected_arrival': expectedArrival?.toIso8601String(),
        'is_active': isActive,
        'reservable_spot_id': reservableSpotId,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'reservable_spot': reservableSpot?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      licensePlate,
      expectedArrival,
      isActive,
      reservableSpotId,
      userId,
      createdAt,
      updatedAt,
      reservableSpot,
    ];
  }
}
