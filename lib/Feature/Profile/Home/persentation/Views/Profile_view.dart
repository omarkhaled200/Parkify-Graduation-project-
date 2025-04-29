import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/ProfileViewbody.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return ProfileViewbody(
      token: token,
    );
  }
}
