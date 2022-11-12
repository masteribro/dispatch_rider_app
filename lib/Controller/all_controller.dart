import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Model/all_model.dart';
import '../Repository/all_repository.dart';
import '../ui/helper/routes/navigation.dart';
import '../ui/intro_screen.dart';
import '../ui/rider_details/riders_stepper_screen.dart';
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
 final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  var path;
  var fileName;


  bool changeIconBool( {String? vehicleRegPath,}){
    if( vehicleRegPath != null) {
      return true;
    }else{
      return false;
    }

  }

  Future signIn()async {
    if (model.signInFormKey.currentState?.validate() == true) {
      setState(() {
        model.loading = true;
      });
      // showDialog(context: context!,
      //     barrierDismissible: false,
      //     builder: (context) => Center(child: CircularProgressIndicator(),));
      try {
        var signInCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: model.emailController.text.trim(),
            password: model.passwordController.text.trim());
        if (signInCredentials.user?.uid != null) {
          PageRouter.gotoWidget(MapScreen(), state!.context);
          showSuccessNotificationWithTime(state!.context,'success', 5);
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
      setState(() {
        model.loading = true;
      });
    try{
      var credentials  = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:  model.regEmailController.text.trim(),
          password: model.regPasswordController.text.trim());
      if (credentials.user?.uid != null){
        PageRouter.gotoWidget(RidersStepperScreen(), state!.context);
        showSuccessNotificationWithTime(state!.context,'success', 5);
      }else{
        showErrorNotification(state!.context, 'An error has occur');
      }
    }on FirebaseAuthException catch(e){
      print(e);
      setState(() {
        model.loading = false;
      });
      // final snackBar = SnackBar(
      //   content: const Text('An error has occur'),
      // );
      // ScaffoldMessenger.of(state!.context).showSnackBar(snackBar);
    }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
      setState(() {
        model.loading = false;
      });
  }}

  void verifyOTP() async {

  }
  Future<void> uploadFile(
      String filePath,
      String? fileName
      )async{
      File file = File(filePath);
      setState(() {
        model.loading = true;
      });
      try{
        await storage.ref('id/personalDoc/$fileName').putFile(file);
        showSuccessNotificationWithTime(state!.context,'success', 5);
        setState(() {
          model.loading = false;
        });
      }on firebase_core.FirebaseException catch (e){
        print(e);
      }
  }
  Future<void> uploadDoc(
      String filePath,
      String? fileName
      )async{
    File file = File(filePath);

     setState(() {
       model.vehicleRegFileN = changeIconBool(vehicleRegPath:model.vehicleRegPath);
       model.ownershipCerti = changeIconBool();
       model.riderLicense = changeIconBool();
       model.insurancePol = changeIconBool();
     });

    try{
      await storage.ref('id/vechicleDoc/$fileName').putFile(file);
      showSuccessNotificationWithTime(state!.context,'success', 5);
      setState(() {
        model.vehicleRegFileN= false;
        model.ownershipCerti = false;
        model.riderLicense = false;
        model.insurancePol = false;
      });
    }on firebase_core.FirebaseException catch (e){
      print(e);
    }
  }

  // Future getImage() async {
  //   final result = await FilePicker.platform.pickFiles(
  //       allowMultiple: false,
  //       type: FileType.custom,
  //       allowedExtensions: ['png','jpg','jpeg','pdf']
  //   );
  //   if (result == null){
  //     ScaffoldMessenger.of(state!.context).showSnackBar(const SnackBar(content: TextView(text: 'No file selected.')));
  //     return null;
  //   }
  //
  //   setState((){
  //     path = result.files.single.path;
  //     fileName = result.files.single.name;
  //   });
  //
  //   debugPrint(path);
  //   debugPrint(fileName);
  //   uploadFile(path!, fileName).then((value) => print('done'));
  // }
  Future createUser(
      {required fName,
        required lName,
        required email,
        required homeAddress,
        required vehicleType,
        required brand,
        required model,
        required year,
        required plateNumber,
        required color,
        required bankName,
        required accountHolderName,
        required accountNumber,
        required bvn,
      })
  async{
    final docUser = FirebaseFirestore.instance.collection("Registration").doc();
    final json = {
      "fName":fName,
      "lName":lName,
      "email":email,
      "homeAddress": homeAddress,
      "vehicleType" :vehicleType,
      "brand" : brand,
      "model" :model,
      "year" : year,
      "plateNumber" :plateNumber,
      "color" :color,
      "bankName" :bankName,
      "accountHolderName" : accountHolderName,
      "accountNumber" : accountNumber,
      "bvn" :bvn,
    };
    if(docUser.path.isNotEmpty) {
      await docUser.set(json);
      showSuccessNotificationWithTime(state!.context,'success', 5);
    }else{
      null;
    }

  }
  void signOut() async {
    try{
      await FirebaseAuth.instance.signOut();
      PageRouter.gotoWidget(const IntroScreen(), state!.context);
      showSuccessNotificationWithTime(state!.context,'Signed out', 5);
    }on FirebaseAuthException catch(e){
      print(e);
    }
  }
}


