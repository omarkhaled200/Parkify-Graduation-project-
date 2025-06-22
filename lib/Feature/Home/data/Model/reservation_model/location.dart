import 'package:equatable/equatable.dart';

class Location extends Equatable {
	final int? id;
	final String? name;

	const Location({this.id, this.name});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				id: json['id'] as int?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};

	@override
	List<Object?> get props => [id, name];
}
