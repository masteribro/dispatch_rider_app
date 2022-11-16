import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'authentication/sign_in/sign_in.dart';
import 'authentication/sign_up/sign_up.dart';
import 'helper/const/color/app_color.dart';
import 'helper/const/widget/button_widget.dart';
import 'helper/const/widget/text_view.dart';
import 'helper/routes/navigation.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Image.asset(
                  'assets/images/Run.png',
                  width: 385.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 120.h),
              Column(
                children: [

                  ButtonWidget(
                      background: AppColor.primary50,
                      fontSize: 16.sp,
                      buttonText: 'SIGN IN',
                      onPressed: () =>
                          PageRouter.gotoWidget(const SignInScreen(), context)),

                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () =>
                        PageRouter.gotoWidget(const SignUpScreen(), context),
                    child: TextView(
                      text: ' Sign up'.toUpperCase(),
                      fontSize: 16.sp,
                      color: AppColor.primary50,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
