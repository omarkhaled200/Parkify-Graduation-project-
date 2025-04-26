import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/Valdiater.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/constant.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kprimaryColor,
        body: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: heaight * 0.08,
              ),
              LogoinenteryImage(width: width, heaight: heaight),
              SizedBox(
                height: heaight * 0.08,
              ),
              Expanded(
                child: Container(
                  width: width,
                  height: heaight * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 16.0, right: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: Assets.textfamily,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: heaight * 0.05),
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
                          SizedBox(height: heaight * 0.04),
                          CustomTextField(
                            hintText: 'PassWord',
                            prefixIcon: Icons.lock_rounded,
                            obscureText: true,
                            suffixIcon: Icons.remove_red_eye_rounded,
                            onchanged: (data) {
                              password = data;
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
                          SizedBox(height: heaight * 0.03),
                          CustomRowAccount(
                            text: "Sign up",
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.signupview);
                            },
                          ),
                          SizedBox(height: heaight * 0.03),
                          Center(
                              child: CustomButton(
                            width: width,
                            heaight: heaight,
                            text: 'Login',
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                GoRouter.of(context)
                                    .push(AppRouter.bottomNaviagationBar);
                              }
                            },
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
