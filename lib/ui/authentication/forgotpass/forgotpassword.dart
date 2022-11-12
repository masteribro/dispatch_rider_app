import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/bg_body.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/const/widget/edit_form_text.dart';
import '../../helper/const/widget/text_view.dart';
import '../../helper/routes/navigation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController forgotPassword = TextEditingController();
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
              text: 'Forgot Password',
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
                  controller: forgotPassword,
                  padding: 35.r,
                  margin: 15.r,
                  fontsize: 14.sp,

                ),

                SizedBox(
                  height: 50.sp,
                ),
                ButtonWidget(
                    background: AppColor.primary50,
                    width: 200.w,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    buttonText: 'Forgot Password',
                    onPressed: () {
                      forgotPass();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future forgotPass()async{
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),));
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email:forgotPassword.text.trim() );
      // Navigator.of(context).popUntil((route) => route.isFirst);
      final snackBar = SnackBar(
            content: const TextView(text: 'Password reset email sent'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }on FirebaseAuthException catch(e){
      print(e);
    }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);

  }
}
