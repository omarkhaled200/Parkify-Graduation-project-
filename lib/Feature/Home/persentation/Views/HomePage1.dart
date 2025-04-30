import 'package:flutter/material.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Homepage1body.dart';

class Homepage1 extends StatelessWidget {
  const Homepage1({super.key, required this.userdata});
  final UserModel userdata;
  @override
  Widget build(BuildContext context) {
    return Homepage1body(
      userdata: userdata,
    );
  }
}
