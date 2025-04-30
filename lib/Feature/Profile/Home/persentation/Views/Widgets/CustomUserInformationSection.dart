import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomLogOutbutton.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomViewHistoryBtn.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/Custom_user_data_details.dart';

class CustomUserInformationSection extends StatelessWidget {
  const CustomUserInformationSection({
    super.key,
    required this.width,
    required this.heaight,
    required this.token,
  });

  final double width;
  final double heaight;
  final String token;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          width: width,
          heaight: heaight,
          text: 'View History',
          onpressed: () {
            GoRouter.of(context).push(AppRouter.Historypage, extra: token);
          },
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          width: width,
          heaight: heaight,
          text: 'My Plates',
          onpressed: () {},
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          icon: FontAwesomeIcons.language,
          width: width,
          heaight: heaight,
          text: "Language",
          onpressed: () {},
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          icon: Icons.info,
          width: width,
          heaight: heaight,
          text: 'About Us',
          onpressed: () {},
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomLogOutbutton(heaight: heaight),
      ],
    );
  }
}
