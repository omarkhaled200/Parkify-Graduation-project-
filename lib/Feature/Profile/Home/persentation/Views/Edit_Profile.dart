import 'package:flutter/material.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/EditProfilebody.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return EditProfilebody(width: width, heaight: heaight);
  }
}
