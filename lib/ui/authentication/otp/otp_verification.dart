import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';
import '../sign_in/sign_in.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary50,
      appBar: AppBar(
          backgroundColor: AppColor.primary50,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.sp,
            ),
            onPressed: () => PageRouter.goBack(context),
          )),
      body: BgBody(
        isAppBar: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: 'OTP Verification',
                fontSize: 26.sp,
                color: AppColor.dark50,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 10.82.h,
              ),
              TextView(
                text: 'Edit Phone number',
                fontSize: 16.sp,
                letterSpacing: .6,
                color: AppColor.primary50,
                fontWeight: FontWeight.w200,
              ),
              TextView(
                text: 'Please enter the OTP sent to you',
                fontSize: 17.sp,
                color: AppColor.black,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 76.32.h,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldWidth: 70,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
              SizedBox(
                height: 18.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ButtonWidget(
                      width: 200.w,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      buttonText: 'Verify',
                      onPressed: () =>
                          PageRouter.gotoWidget(const SignInScreen(), context),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextView(
                      text: 'Resend OTP',
                      fontSize: 17.sp,
                      color: AppColor.spaceGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
