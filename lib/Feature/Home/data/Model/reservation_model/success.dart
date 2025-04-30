import 'package:equatable/equatable.dart';

class Success extends Equatable {
	final String? licensePlate;
	final DateTime? expectedArrival;
	final int? userId;
	final int? reservableSpotId;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const Success({
		this.licensePlate, 
		this.expectedArrival, 
		this.userId, 
		this.reservableSpotId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Success.fromJson(Map<String, dynamic> json) => Success(
				licensePlate: json['license_plate'] as String?,
				expectedArrival: json['expected_arrival'] == null
						? null
						: DateTime.parse(json['expected_arrival'] as String),
				userId: json['user_id'] as int?,
				reservableSpotId: json['reservable_spot_id'] as int?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'license_plate': licensePlate,
				'expected_arrival': expectedArrival?.toIso8601String(),
				'user_id': userId,
				'reservable_spot_id': reservableSpotId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				licensePlate,
				expectedArrival,
				userId,
				reservableSpotId,
				updatedAt,
				createdAt,
				id,
		];
	}
}
