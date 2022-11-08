import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Model/all_model.dart';
import '../Repository/all_repository.dart';
import '../main.dart';
import '../ui/authentication/sign_in/sign_in.dart';
import '../ui/helper/const/color/app_color.dart';
import '../ui/helper/const/widget/text_view.dart';
import '../ui/helper/routes/navigation.dart';
import '../ui/intro_screen.dart';
import '../ui/screens/map_folder/map_screen.dart';
import '../utills/flush_bar_mixin.dart';

class Controller extends ControllerMVC with FlushBarMixin {
  BuildContext? context;

  factory Controller([StateMVC? state]) =>
      _this ??= Controller._(state);
  Controller._(StateMVC? state)
      : model = AllModel(),
        super(state);
  static Controller? _this;

  final AllModel model;

  final Repo authRepo = Repo();



  Future signIn()async {
    if (model.signInFormKey.currentState?.validate() == true) {
      setState(() {
        model.loading = true;
      });
      // showDialog(context: context!,
      //     barrierDismissible: false,
      //     builder: (context) => Center(child: CircularProgressIndicator(),));
      try {
        var signInCredentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: model.emailController.text.trim(),
            password: model.passwordController.text.trim());
        if (signInCredentials.user?.uid != null) {
          PageRouter.gotoWidget(MapScreen(), state!.context);
        } else {
          showSuccessNotification(state!.context, 'An error has occur');
        }
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
      setState(() {
        model.loading = false;
      });
    }
  }

  Future signUp()async{
    if (model.regFormKey.currentState?.validate() == true) {
    showDialog(context: state!.context,
        barrierDismissible: false,
        builder: (context) => Center(child: SpinKitDoubleBounce(
          color: AppColor.primary50,
          size: 70.0.h,
        ),));
    try{
      var credentials  = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:  model.regEmailController.text.trim(),
          password: model.regPasswordController.text.trim());
      if (credentials.user?.uid != null){
        PageRouter.gotoWidget( SignInScreen(), state!.context);
      }else{
        final snackBar = SnackBar(
          content: const Text('An error has occur'),
        );
        ScaffoldMessenger.of(state!.context).showSnackBar(snackBar);
      }

    }on FirebaseAuthException catch(e){
      print(e);
    }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);

  }}

  void verifyOTP() async {

  }

  void phoneVerification() async {
  }

  void signOut() async {

    try{
      await FirebaseAuth.instance.signOut();
      PageRouter.gotoWidget(const IntroScreen(), state!.context);
    }on FirebaseAuthException catch(e){
      print(e);
    }
  }
}

class Data {
  String? uuid;

  Data({this.uuid});

  Data.fromJson(Map<String, dynamic> json) {
    Data(
      uuid: json["uuid"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"uuid": uuid};
  }
}
