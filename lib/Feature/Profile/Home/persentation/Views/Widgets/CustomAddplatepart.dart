import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomDisplayContent.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Post%20Add%20License%20Plate/post_add_license_plate_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Post%20Get%20license%20plate/post_get_license_plate_cubit.dart';

class CustomAddplatepart extends StatefulWidget {
  const CustomAddplatepart({super.key, required this.token, this.onPlateAdded});
  final String token;
  final VoidCallback? onPlateAdded;
  @override
  State<CustomAddplatepart> createState() => _CustomAddplatepartState();
}

class _CustomAddplatepartState extends State<CustomAddplatepart> {
  String? plateText;
  bool isExtractingPlate = false;

  File? _imageFile;
  bool _isChecked = false;
  final ImagePicker _picker = ImagePicker();
  bool isCarPlateConfirmed = false;
  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Choose an option',
            style: TextStyle(
                fontFamily: Assets.textfamily, fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        isExtractingPlate = true;
      });

      context.read<PostGetLicensePlateCubit>().postgetlicenseplate(
            image: File(pickedFile.path),
          );
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<PostAddLicensePlateCubit, PostAddLicensePlateState>(
      listener: (context, state) {
        if (state is PostAddLicensePlateFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
        } else if (state is PostAddLicensePlateSuccess) {
          CustomScaffoldMessenger(context, 'added Successfully',
              Icons.check_circle_outline, Colors.green);
          widget.onPlateAdded?.call();
        }
      },
      builder: (context, state) {
        return BlocConsumer<PostGetLicensePlateCubit, PostGetLicensePlateState>(
          listener: (context, state) {
            if (state is PostGetLicensePlateFailure) {
              CustomScaffoldMessenger(
                context,
                state.errmessage,
                Icons.error,
                Colors.red,
              );
              setState(() {
                isExtractingPlate = false;
              });
            } else if (state is PostGetLicensePlateSuccess) {
              setState(() {
                plateText = state.plate;
                isExtractingPlate = false;
              });
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: heaight * 0.01,
                ),
                Text(
                  'Add Plate',
                  style: TextStyle(
                    fontFamily: Assets.textfamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: heaight * 0.01,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _pickImage,
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 85,
                  ),
                ),
                if (isExtractingPlate) ...[
                  const SpinKitFadingCircle(
                    color: Colors.black,
                  ),
                ] else if (plateText != null) ...[
                  CustomDisplayContent(
                    width: width,
                    heaight: heaight,
                    text: plateText!,
                  ),
                ],
                SizedBox(
                  height: heaight * 0.01,
                ),
                CustomButton(
                  width: width,
                  heaight: heaight,
                  text: 'Submit',
                  onPressed: () {
                    if (plateText != null && plateText!.isNotEmpty) {
                      context
                          .read<PostAddLicensePlateCubit>()
                          .postaddlicenseplate(
                              plate: plateText!, token: widget.token);
                    } else {
                      CustomScaffoldMessenger(
                        context,
                        'Please upload a valid plate first!',
                        Icons.error,
                        Colors.red,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: heaight * 0.01,
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 1,
                  color: Colors.black,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
