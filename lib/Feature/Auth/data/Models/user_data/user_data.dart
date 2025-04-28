import 'package:equatable/equatable.dart';
import 'user.dart';
import 'user_data.dart';

class UserModel extends Equatable {
  final String? token;
  final User? user;
  final UserModel? userData;

  const UserModel({this.token, this.user, this.userData});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      userData: json['userData'] != null
          ? UserModel.fromJson(json['userData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
        'userData': userData?.toJson(),
      };

  @override
  List<Object?> get props => [token, user, userData];
}
