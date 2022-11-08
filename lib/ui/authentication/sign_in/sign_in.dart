import 'package:dispatch_rider_app/ui/screens/map_folder/destination.dart';
import 'package:dispatch_rider_app/ui/screens/map_folder/map_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Controller/all_controller.dart';
import '../../../main.dart';
import '../../../utills/validation.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/edit_form_text.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../forgotpass/forgotpassword.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SignInScreenState();
}

class _SignInScreenState extends StateMVC<SignInScreen> with ValidationMixin{
  _SignInScreenState() : super(Controller()) {
    con = controller as Controller;
  }
  late Controller con;

 // @override
 //  void dispose() {
 //   con.model.passwordController.dispose();
 //   con.model.emailController.dispose();
 //    super.dispose();
 //  }
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
      body: SingleChildScrollView(
        child: BgBody(
          isAppBar: true,
          child: SingleChildScrollView(
            child: Form(
              key: con.model.signInFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/Run.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  EditFormText(
                      isSignIn: true,
                      labelText: 'Email',
                    controller: con.model.emailController,
                      padding: 35.r,
                      margin: 15.r,
                      fontsize: 14.sp,
                      validation: validateEmail,
                  ),
                  EditFormText(
                      isSignIn: true,
                      controller: con.model.passwordController,
                      labelText: 'Password',
                      padding: 35.r,
                      margin: 15.r,
                      validation: validatePassword,
                      fontsize: 14.sp),
                  SizedBox(
                    height: 100.sp,
                  ),
                  ButtonWidget(
                    background: AppColor.primary50,
                    width: 200.w,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    buttonText: 'Sign in',
                    loading: con.model.loading,
                    onPressed: con.signIn,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextView(
                    text: 'Forgot password?',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColor.primary50,
                    onTap: (){
                      PageRouter.gotoWidget(const ForgotPassword(), context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
