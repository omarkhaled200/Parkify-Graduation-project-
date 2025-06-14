import 'package:equatable/equatable.dart';

class ReservableSpot extends Equatable {
	final int? id;
	final String? spotCode;

	const ReservableSpot({this.id, this.spotCode});

	factory ReservableSpot.fromJson(Map<String, dynamic> json) {
		return ReservableSpot(
			id: json['id'] as int?,
			spotCode: json['spot_code'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'spot_code': spotCode,
			};

	@override
	List<Object?> get props => [id, spotCode];
}
