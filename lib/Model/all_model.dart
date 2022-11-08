import 'package:flutter/cupertino.dart';

class AllModel{
  final GlobalKey<FormState> regFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  bool loading = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController regPasswordController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
}