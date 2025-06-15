import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/Post%20Get%20license%20plate/post_get_license_plate_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/Setup_User_Data_Cubit/setup_user_data_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomCheckbox.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomDisplayContent.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/constant.dart';

class Dateentry1body extends StatefulWidget {
  const Dateentry1body({super.key});

  @override
  State<Dateentry1body> createState() => _Dateentry1bodyState();
}

class _Dateentry1bodyState extends State<Dateentry1body> {
  String? NationalId;
  String? Phone;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();
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
    final oldUserModel = GoRouterState.of(context).extra as UserModel?;

    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<SetupUserDataCubit, SetupUserDataState>(
      listener: (context, state) async {
        if (state is SetupUserDataFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
        } else if (state is SetupUserDataSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline, Colors.green);
          if (oldUserModel != null) {
            final newUserData = state.user.userData;
            final updatedUser = oldUserModel.copyWith(userData: newUserData);

            GoRouter.of(context).push(
              AppRouter.bottomNaviagationBar,
              extra: updatedUser,
            );
          }
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
            return Scaffold(
              backgroundColor: kprimaryColor,
              body: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: heaight * 0.059,
                    ),
                    LogoinenteryImage(width: width, heaight: heaight),
                    SizedBox(
                      height: heaight * 0.059,
                    ),
                    Expanded(
                      child: Container(
                        width: width,
                        height: heaight * 0.72,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16.0, right: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: heaight * 0.02),
                                CustomTextField(
                                  typekeyboard: TextInputType.number,
                                  hintText: 'National ID',
                                  prefixIcon: FontAwesomeIcons.idCard,
                                  onchanged: (data) {
                                    NationalId = data;
                                  },
                                  valdiate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your National ID';
                                    }
                                    if (value.length != 14) {
                                      return 'National ID must be exactly 14 digits';
                                    }
                                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      return 'National ID must contain only numbers';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: heaight * 0.02),
                                CustomTextField(
                                  typekeyboard: TextInputType.number,
                                  hintText: 'Phone',
                                  prefixIcon: FontAwesomeIcons.phone,
                                  onchanged: (data) {
                                    Phone = data;
                                  },
                                  valdiate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    if (value.length != 11) {
                                      return 'Phone number must be exactly 11 digits';
                                    }
                                    if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid Egyptian phone number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: heaight * 0.02),
                                Row(
                                  children: [
                                    Image.asset(Assets.licenseplate,
                                        width: 45,
                                        height: 30,
                                        color: Colors.grey),
                                    const SizedBox(width: 10),
                                    Text(
                                      "License Plate",
                                      style: TextStyle(
                                          fontFamily: Assets.textfamily,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(height: heaight * 0.01),
                                Center(
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: _pickImage,
                                    icon: const Icon(
                                      Icons.camera_alt_rounded,
                                      size: 64,
                                    ),
                                  ),
                                ),
                                SizedBox(height: heaight * 0.02),
                                if (plateText != null) ...[
                                  if (isExtractingPlate)
                                    const SpinKitFadingCircle(
                                      color: Colors.black,
                                    )
                                  else if (plateText != null)
                                    CustomDisplayContent(
                                      width: width,
                                      heaight: heaight,
                                      text: plateText!,
                                    ),
                                ],
                                SizedBox(height: heaight * 0.02),
                                CustomCheckbox(
                                  onChanged: (value) {
                                    setState(() => isCarPlateConfirmed = value);
                                  },
                                ),
                                SizedBox(height: heaight * 0.03),
                                Center(
                                    child: state is SetupUserDataLoading
                                        ? const SpinKitFadingCircle(
                                            color: Colors.black,
                                          )
                                        : CustomButton(
                                            width: width,
                                            heaight: heaight,
                                            text: 'Next',
                                            onPressed: () async {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                if (isCarPlateConfirmed ==
                                                    true) {
                                                  context
                                                      .read<
                                                          SetupUserDataCubit>()
                                                      .UserSetup(
                                                        National: NationalId!,
                                                        Phone: Phone!,
                                                        plate: plateText!,
                                                        token: oldUserModel!
                                                            .token!,
                                                      );
                                                }
                                              }
                                            })),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
