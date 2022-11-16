import 'package:dispatch_rider_app/ui/authentication/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Constant/globalVariable.dart';
import '../../../Controller/all_controller.dart';
import '../../../Model/all_model.dart';
import '../../../main.dart';
import '../../../utills/validation.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/edit_form_text.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SignUpScreenState();
}

class _SignUpScreenState extends StateMVC<SignUpScreen> with ValidationMixin {
  _SignUpScreenState() : super(Controller()) {
    con = controller as Controller;
  }
  late Controller con;
// @override
//   void dispose() {
//   AllModel.regFormKey;
//     super.dispose();
//   }
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
        body: SingleChildScrollView(
          child: BgBody(
            isAppBar: true,
            child: SingleChildScrollView(
              child: Form(
                key: con.model.regFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EditFormText(
                        isSignIn: true,
                      controller: con.model.regEmailController ,
                        labelText: 'Email',
                        padding: 35.r,
                        margin: 15.r,
                        validation: validateEmail,
                        fontsize: 14.sp),
                    EditFormText(
                      isSignIn: true,
                      controller: con.model.regPasswordController,
                      labelText: 'Password',
                      padding: 35.r,
                      validation: validatePassword,
                      margin: 15.r,
                      fontsize: 14.sp,
                    ),
                    EditFormText(
                        isSignIn: true,
                        labelText: 'Confirm Password',
                        validation: (val){
                          if(val == null) {
                            return 'Empty';}
                          if(val != con.model.regPasswordController.text.trim()) {
                            return 'Not Match';
                          }
                          return null;
                        },
                        padding: 35.r,
                        controller: con.model.regConfirmPasswordController,
                        margin: 15.r,
                        fontsize: 14.sp

                    ),
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
                      height: 40.h,
                    ),
                    ButtonWidget(
                      background: AppColor.primary50,
                      width: 200.w,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      buttonText: 'Continue'.toUpperCase(),
                      onPressed: con.signUp,
                      loading: con.model.loading,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

}
