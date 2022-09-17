import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/edit_form_text.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';
import '../otp/otp_verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          centerTitle: true,
          title: TextView(
            text: 'Sign Up',
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            color: Colors.white,
          ),
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
                    labelText: '+234',
                    padding: 35.r,
                    margin: 15.r,
                    fontsize: 14.sp),
                EditFormText(
                  labelText: 'Password',
                  padding: 35.r,
                  margin: 15.r,
                  fontsize: 14.sp,
                ),
                EditFormText(
                    labelText: 'Confirm Password',
                    padding: 35.r,
                    margin: 15.r,
                    fontsize: 14.sp),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'By tapping continue, you agree to our',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' terms and conditions',
                            style: TextStyle(
                                color: AppColor.primary50, fontSize: 10.sp),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                ButtonWidget(
                  width: 200.w,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  buttonText: 'Continue'.toUpperCase(),
                  onPressed: () => PageRouter.gotoWidget(
                      const OtpVerificationScreen(), context),
                )
              ],
            ),
          ),
        ));
  }
}
