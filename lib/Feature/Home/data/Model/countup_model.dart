import 'package:equatable/equatable.dart';

class CountupModel extends Equatable {
	final int? hour;
	final int? min;
	final int? sec;

	const CountupModel({this.hour, this.min, this.sec});

	factory CountupModel.fromJson(Map<String, dynamic> json) => CountupModel(
				hour: json['hour'] as int?,
				min: json['min'] as int?,
				sec: json['sec'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'hour': hour,
				'min': min,
				'sec': sec,
			};

	@override
	List<Object?> get props => [hour, min, sec];
}
