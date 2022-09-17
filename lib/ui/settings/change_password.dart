import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/const/color/app_color.dart';
import '../helper/const/widget/button_widget.dart';
import '../helper/const/widget/custom_appbar.dart';
import '../helper/const/widget/edit_form_text.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import '../profile/user_profile.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
              size: 22.sp,
            ),
            onPressed: () => PageRouter.goBack(context),
          ),
          title: 'Change Password',
          backgroundColor: AppColor.white),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.r),
        child: Column(
          children: [
            EditFormText(
                isSignIn: true,
                labelText: 'Old Password',
                padding: 35.r,
                margin: 15.r,
                fontsize: 14.sp),
            EditFormText(
                isSignIn: true,
                labelText: 'New Password',
                padding: 35.r,
                margin: 15.r,
                fontsize: 14.sp),
            EditFormText(
                isSignIn: true,
                labelText: 'Confirm New Password',
                padding: 35.r,
                margin: 15.r,
                fontsize: 14.sp),
            SizedBox(
              height: 25.h,
            ),
            TextView(
              text: 'your password should contain letters and numbers',
              fontWeight: FontWeight.w200,
              fontSize: 12.sp,
              color: AppColor.primary50,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextView(
              text: 'Forgot Password?',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColor.primary50,
            ),
            SizedBox(
              height: 22.h,
            ),
            Center(
              child: ButtonWidget(
                width: 200.w,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                buttonText: 'Save'.toUpperCase(),
                onPressed: () =>
                    PageRouter.gotoWidget(const UserProfileScren(), context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
