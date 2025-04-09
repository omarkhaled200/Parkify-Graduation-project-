import 'package:flutter/material.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomLogOutbutton.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomViewHistoryBtn.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/Custom_user_data_details.dart';

class CustomUserInformationSection extends StatelessWidget {
  const CustomUserInformationSection({
    super.key,
    required this.width,
    required this.heaight,
  });

  final double width;
  final double heaight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12),
          child: Column(
            children: [
              SizedBox(
                height: heaight * 0.01,
              ),
              Custom_user_data_details(
                titledata: 'Email',
                descdata: 'Omarkhaled.6403@gmail.com',
              ),
              SizedBox(
                height: heaight * 0.01,
              ),
              Custom_user_data_details(
                titledata: 'Phone Number',
                descdata: '+20 100 000 0000',
              ),
              SizedBox(
                height: heaight * 0.01,
              ),
              CustomViewHistoryBtn(width: width, heaight: heaight),
              SizedBox(
                height: heaight * 0.01,
              ),
              CustomLogOutbutton(heaight: heaight),
            ],
          ),
        ),
      ),
    );
  }
}
