import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Valdiater.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_Register_New_Account_cubit/user_register_new_account_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/constant.dart';

class Signupviewbody extends StatefulWidget {
  const Signupviewbody({super.key});

  @override
  State<Signupviewbody> createState() => _SignupviewbodyState();
}

class _SignupviewbodyState extends State<Signupviewbody> {
  String? fullname;
  String? email;

  GlobalKey<FormState> formkey = GlobalKey();
  String? password;
  String? confirm_password;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<UserRegisterNewAccountCubit,
        UserRegisterNewAccountState>(
      listener: (context, state) {
        if (state is UserRegisterNewAccountFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
        } else if (state is UserRegisterNewAccountSuccess) {
          if (state.user.userData == null) {
            CustomScaffoldMessenger(context, "We need some data Please 🤦‍♂️",
                Icons.warning, Colors.red);
            GoRouter.of(context)
                .push(AppRouter.dataentry1view, extra: state.user);
          }
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 22, left: 16, right: 16, bottom: 22),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Signup",
                              style: TextStyle(
                                fontFamily: Assets.textfamily,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: heaight * 0.02),
                            CustomTextField(
                              hintText: 'Full Name',
                              prefixIcon: Icons.person,
                              onchanged: (data) {
                                fullname = data;
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter  your Full name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: heaight * 0.015),
                            CustomTextField(
                              hintText: 'User Name',
                              prefixIcon: Icons.person,
                              onchanged: (data) {
                                email = data;
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email like  ......@org.com';
                                }
                                if (!valdiate().valdiateemail(email: email) ||
                                    !valdiate().valdiateemail(email: email)) {
                                  return 'Please enter a valid email';
                                }
                              },
                            ),
                            SizedBox(height: heaight * 0.015),
                            CustomTextField(
                              hintText: 'PassWord',
                              prefixIcon: Icons.lock_rounded,
                              obscureText: obscurePassword,
                              suffixIcon: Icons.remove_red_eye_rounded,
                              onchanged: (data) {
                                password = data;
                              },
                              onpressed: () {
                                setState(() {
                                  obscurePassword:
                                  !obscurePassword;
                                });
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please  Enter your password';
                                }
                                if (!valdiate()
                                        .valdiatepassword(password: password) ||
                                    !valdiate()
                                        .valdiatepassword(password: password)) {
                                  return 'It must contain at least one uppercase letter (e.g., A, B, C...)\nIt must contain at least one lowercase letter (e.g., a, b, c...) \nIt must contain at least one number (e.g., 0, 1, 2...).\nIt must contain at least one special character (e.g., !, @, #, &, *, ~).\nIt must be at least 8 characters long';
                                }
                              },
                            ),
                            SizedBox(height: heaight * 0.015),
                            CustomTextField(
                              hintText: 'Confirm Password',
                              prefixIcon: Icons.lock_rounded,
                              obscureText: obscureConfirmPassword,
                              suffixIcon: Icons.remove_red_eye_rounded,
                              onchanged: (data) {
                                confirm_password = data;
                              },
                              onpressed: () {
                                setState(() {
                                  obscureConfirmPassword:
                                  !obscureConfirmPassword;
                                });
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter your Confirm password';
                                }
                                if (value != password) {
                                  return 'Confirm password not match password';
                                }
                                if (!valdiate()
                                        .valdiatepassword(password: password) ||
                                    !valdiate()
                                        .valdiatepassword(password: password)) {
                                  return 'Please enter a valid password';
                                }
                              },
                            ),
                            SizedBox(height: heaight * 0.015),
                            CustomRowAccount(
                              text: 'Sign in',
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
                            ),
                            SizedBox(height: heaight * 0.015),
                            Center(
                              child: state is UserRegisterNewAccountLoading
                                  ? const SpinKitFadingCircle(
                                      color: Colors.black,
                                    )
                                  : CustomButton(
                                      width: width,
                                      heaight: heaight,
                                      text: 'Register',
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          if (password == confirm_password &&
                                              valdiate().valdiateemail(
                                                  email: email) &&
                                              valdiate().valdiatepassword(
                                                  password: password)) {
                                            context
                                                .read<
                                                    UserRegisterNewAccountCubit>()
                                                .UserRegister(
                                                    email: email!,
                                                    password: password!,
                                                    name: fullname!,
                                                    confirmpassword:
                                                        confirm_password!);
                                          }
                                        }
                                      },
                                    ),
                            ),
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
  }
}
