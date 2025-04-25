import 'package:equatable/equatable.dart';

import 'user.dart';
import 'user_data.dart';

class UserData extends Equatable {
  final String? token;
  final User? user;
  final UserData? userData;

  const UserData({this.token, this.user, this.userData});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        userData: json['userData'] == null
            ? null
            : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
        'userData': userData?.toJson(),
      };

  @override
  List<Object?> get props => [token, user, userData];
}
