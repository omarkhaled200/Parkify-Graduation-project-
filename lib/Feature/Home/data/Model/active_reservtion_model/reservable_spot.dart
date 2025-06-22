import 'package:equatable/equatable.dart';

import '../reservation_model/location.dart';

class ReservableSpot extends Equatable {
  final int? id;
  final String? spotCode;
  final int? locationId;
  final Location? location;

  const ReservableSpot({
    this.id,
    this.spotCode,
    this.locationId,
    this.location,
  });

  factory ReservableSpot.fromJson(Map<String, dynamic> json) {
    return ReservableSpot(
      id: json['id'] as int?,
      spotCode: json['spot_code'] as String?,
      locationId: json['location_id'] as int?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'spot_code': spotCode,
        'location_id': locationId,
        'location': location?.toJson(),
      };

  @override
  List<Object?> get props => [id, spotCode, locationId, location];
}
