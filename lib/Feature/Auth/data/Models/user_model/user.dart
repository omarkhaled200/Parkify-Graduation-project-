import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final dynamic emailVerifiedAt;

	const User({this.id, this.name, this.email, this.emailVerifiedAt});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'email_verified_at': emailVerifiedAt,
			};

	@override
	List<Object?> get props => [id, name, email, emailVerifiedAt];
}
