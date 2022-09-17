import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/edit_form_text.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';
import '../../rider_details/riders_stepper_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary50,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.sp,
          ),
          onPressed: () => PageRouter.goBack(context),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextView(
              text: 'Sign In',
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: AppColor.primary50,
      ),
      body: BgBody(
        isAppBar: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditFormText(
                  isSignIn: true,
                  labelText: 'Mobile Number',
                  padding: 35.r,
                  margin: 15.r,
                  fontsize: 14.sp),
              EditFormText(
                  isSignIn: true,
                  labelText: 'Password',
                  padding: 35.r,
                  margin: 15.r,
                  fontsize: 14.sp),
              SizedBox(
                height: 100.sp,
              ),
              ButtonWidget(
                width: 200.w,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                buttonText: 'Sign in',
                onPressed: () =>
                    PageRouter.gotoWidget(const RidersStepperScreen(), context),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextView(
                text: 'Forgot password?',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColor.primary50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
