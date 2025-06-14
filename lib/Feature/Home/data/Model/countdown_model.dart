import 'package:equatable/equatable.dart';

class CountdownModel extends Equatable {
	final int? reservationDifference;
	final int? countdown;

	const CountdownModel({this.reservationDifference, this.countdown});

	factory CountdownModel.fromJson(Map<String, dynamic> json) {
		return CountdownModel(
			reservationDifference: json['reservation_difference'] as int?,
			countdown: json['countdown'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'reservation_difference': reservationDifference,
				'countdown': countdown,
			};

	@override
	List<Object?> get props => [reservationDifference, countdown];
}
