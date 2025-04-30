import 'package:equatable/equatable.dart';

import 'spot.dart';
import 'success.dart';

class ReservationModel extends Equatable {
	final Success? success;
	final Spot? spot;
	final String? reservationTime;

	const ReservationModel({this.success, this.spot, this.reservationTime});

	factory ReservationModel.fromJson(Map<String, dynamic> json) {
		return ReservationModel(
			success: json['success'] == null
						? null
						: Success.fromJson(json['success'] as Map<String, dynamic>),
			spot: json['spot'] == null
						? null
						: Spot.fromJson(json['spot'] as Map<String, dynamic>),
			reservationTime: json['reservation_time'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success?.toJson(),
				'spot': spot?.toJson(),
				'reservation_time': reservationTime,
			};

	@override
	List<Object?> get props => [success, spot, reservationTime];
}
