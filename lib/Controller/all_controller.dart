import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Model/all_model.dart';
import '../Repository/all_repository.dart';
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



  void signIn() async {

  }

  void signUp() async {
  }

  void verifyOTP() async {

  }

  void phoneVerification() async {
  }

  void signOut(BuildContext context) async {


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
