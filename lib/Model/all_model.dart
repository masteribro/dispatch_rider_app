import 'package:flutter/cupertino.dart';

class AllModel{
  final GlobalKey<FormState> regFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  String? vehicleRegPath;
  String? vehicleRegFileNam;
  String? ownerCertPath;
  String? ownerCertFileNam;
  String? insurPolPath;
  String? insurPolFileNam;
  String? driverLicPath;
  String? driverLicFileNam;
  bool loading = false;
  bool vehicleRegFileN = false;
  bool ownershipCerti= false;
  bool insurancePol = false;
  bool riderLicense = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController regPasswordController = TextEditingController();
  final TextEditingController regConfirmPasswordController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bvnController = TextEditingController();



}