import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ReservationViewbody.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userdata = GoRouterState.of(context).extra as UserModel;
    return ReservationViewbody(
      userData: userdata,
    );
  }
}
