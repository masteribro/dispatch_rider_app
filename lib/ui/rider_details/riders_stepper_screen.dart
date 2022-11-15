import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispatch_rider_app/utills/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Controller/all_controller.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/button_widget.dart';
import '../helper/const/widget/custom_appbar.dart';
import '../helper/const/widget/edit_form_text.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import 'package:file_picker/file_picker.dart';
import '../profile/profile_screen.dart';
import '../screens/map_folder/map_screen.dart';

class RidersStepperScreen extends StatefulWidget {
  const RidersStepperScreen({Key? key}) : super(key: key);

  @override
  State createState() => _RidersStepperScreenState();
}

class _RidersStepperScreenState extends StateMVC<RidersStepperScreen> with ValidationMixin {
  _RidersStepperScreenState() : super(Controller()) {
    con = controller as Controller;
  }
  late Controller con;
  int currentStep = 0;
  int groupValue = -1;

  List<String> title = [
    'Create profile',
    'Personal Document',
    'Add Vehicle',
    'Vehicle Document',
    'Bank Details'
  ];

  Widget _myRadioButton({String? title, int? value, dynamic onChanged}) {
    return Row(
      children: [
        TextView(
          text: title!,
          fontSize: 9.5.sp,
          fontWeight: FontWeight.w400,
          maxLines: 1,
        ),
        Radio(
          activeColor: AppColor.primary50,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
  String? fileName;
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: defaultAppBar(
          context,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
              size: 22.sp,
            ),
            onPressed: () => PageRouter.goBack(context),
          ),
          title: title[currentStep],
          backgroundColor: AppColor.white,
          actions: [
            currentStep == 2
                ? Padding(
                    padding: EdgeInsets.only(right: 12.r, top: 12.r),
                    child: TextView(
                      text: 'Skip',
                      fontSize: 18.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary: AppColor.primary50)),
          child: Stepper(
            elevation: 0,
            steps: getSteps(),
            currentStep: currentStep,
            type: StepperType.horizontal,
            onStepContinue: () {
              final lastStep = currentStep == getSteps().length - 1;
              if (lastStep) {
                PageRouter.gotoWidget(MapScreen(), context);
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
            controlsBuilder: (context, details) {
              return Container(
                margin: EdgeInsets.only(top: 30.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentStep != 0)
                      ButtonWidget(
                        buttonText: 'Back',
                        onPressed: details.onStepCancel,
                        width: 65.w,
                        height: 25.h,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ButtonWidget(
                      buttonText: 'Next',
                      onPressed: (){
                        details.onStepContinue!();
                        final fName = con.model.fName.text;
                        final lName=con.model.lName.text;
                        final email=con.model.email.text;
                        final homeAddress=con.model.homeAddress.text;
                        final vehicleType= con.model.vehicleController.text;
                        final brand = con.model.brandController.text;
                        final model = con.model.modelController.text;
                        final year = con.model.yearController.text;
                        final plateNumber = con.model.plateNumberController.text;
                        final color = con.model.colorController.text;
                        final bankName = con.model.bankNameController.text ;
                        final accountHolderName = con.model.accountNameController.text;
                        final accountNumber = con.model.accountNumberController.text;
                        final bvn = con.model.bvnController.text;
                        if(currentStep >= 4){
                          print(currentStep);
                          con.createUser(
                              fName:fName,
                              lName:lName,
                              email:email,
                              homeAddress:homeAddress,
                              vehicleType: vehicleType,
                              brand: brand,
                              model: model,
                              year: year,
                              plateNumber: plateNumber,
                              color: color,
                              bankName: bankName,
                              accountHolderName: accountHolderName,
                              accountNumber: accountNumber,
                              bvn: bvn
                          );
                        }
                        },
                      width: 65.w,
                      height: 25.h,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  List<Step> getSteps() => [
        Step(
            isActive: currentStep >= 0,
            title: Container(),
            content: Column(
              children: [
                TextView(
                  text:
                      'Please make sure that your details match that of  your personal documents.',
                  fontSize: 13.sp,
                  color: AppColor.primary50,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 25.h,
                ),
                EditFormText(
                    isSignIn: true,
                    labelText: 'First name',
                    fontsize: 16.sp,
                    padding: 0.r,
                    controller: con.model.fName,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Last name',
                    controller: con.model.lName,
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
                EditFormText(
                    isSignIn: true,
                    labelText: 'E-Mail',
                    controller: con.model.email,
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Home Address',
                    controller: con.model.homeAddress,
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Password',
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
              ],
            )),
        Step(
            isActive: currentStep >= 1,
            title: Container(),
            content: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _myRadioButton(
                        title: 'Drivers license',
                        value: 0,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue),
                      ),
                      _myRadioButton(
                        title: 'Passport',
                        value: 1,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue),
                      ),
                      _myRadioButton(
                        title: 'National I.D card',
                        value: 2,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue),
                      ),
                      _myRadioButton(
                        title: 'Voters card',
                        value: 3,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextView(
                  text:
                      'Upload the PDF, JPG or PNG format of selected document',
                  fontSize: 12.sp,
                  color: AppColor.dark50,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                path == null  ? SvgPicture.asset('assets/svg/download_icon.svg') :Image.file(File(path!), scale: 8,),
                SizedBox(
                  height: 20.h,
                ),
                ButtonWidget(
                  buttonText: 'Select document',
                  loading: con.model.loading,
                  onPressed: () async{

                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png','jpeg', 'jpg', 'pdf']
                    );
                    if (result == null){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: TextView(text: 'No file selected.')));
                      return null;
                    }

                    setState((){
                      path = result.files.single.path;
                      fileName = result.files.single.name;
                    });

                    debugPrint(path);
                    debugPrint(fileName);
                    con.uploadFile(path!, fileName).then((value) => print('done'));

                  },
                  width: 126.w,
                  height: 35.5.h,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                )
              ],
            )),
        Step(
            isActive: currentStep >= 2,
            title: Container(),
            content: Column(
              children: [
                EditFormText(
                    controller: con.model.vehicleController,
                    isSignIn: true,
                    labelText: 'Vehicle Type',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.brandController,
                    isSignIn: true,
                    labelText: 'Brand (Auto Suggestion)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.modelController,
                    isSignIn: true,
                    labelText: 'Model (Auto suggestion)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.yearController,
                    isSignIn: true,
                    labelText: 'Year (optional)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.plateNumberController,
                    isSignIn: true,
                    labelText: 'Plate number*',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.colorController,
                    isSignIn: true,
                    labelText: 'Color',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
              ],
            )),
        Step(
            isActive: currentStep >= 3,
            title: Container(),
            content: Column(
              children: [
                TextView(
                  text:
                      'Upload PDF, JPG or PNG format of your vehicle documents',
                  fontSize: 12.sp,
                  color: AppColor.primary50,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 30.h,
                ),
                rowItem(text: 'Vehicle registration', pathLink: con.model.vehicleRegPath, fileNam: con.model.vehicleRegFileNam, iconLoading: con.model.vehicleRegFileN),
                rowItem(text:'Ownership certificate', pathLink: con.model.ownerCertPath, fileNam: con.model.ownerCertFileNam, iconLoading: con.model.ownershipCerti),
                rowItem(text:'Insurance policy', pathLink: con.model.insurPolPath, fileNam: con.model.insurPolFileNam, iconLoading: con.model.insurancePol ),
                rowItem(text:'Driver/ rider license', pathLink: con.model.driverLicPath, fileNam: con.model.driverLicFileNam, iconLoading: con.model.riderLicense),
              ],
            )),
        Step(
            isActive: currentStep >= 4,
            title: Container(),
            content: Column(
              children: [
                EditFormText(
                    controller: con.model.bankNameController,
                    isSignIn: true,
                    labelText: 'Bank Name',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.accountNameController,
                    isSignIn: true,
                    labelText: 'Account Holder Name',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.accountNumberController,
                    isSignIn: true,
                    labelText: 'Account Number',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    controller: con.model.bvnController,
                    isSignIn: true,
                    labelText: 'BVN',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text:
                            'By continuing, I confirm that i have read & agree to the',
                        style: TextStyle(
                            color: AppColor.spaceGrey, fontSize: 13.sp),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms & conditions',
                            style: TextStyle(
                                color: AppColor.primary50, fontSize: 13.sp),
                          )
                        ]),
                  ),
                )
              ],
            )),
      ];

  rowItem({String? text, String? pathLink, String? fileNam, required bool iconLoading}) => Container(
        margin: EdgeInsets.only(bottom: 25.r),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColor.whiteGrey1,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: Padding(
                  padding: EdgeInsets.all(21.r),
                  child: Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async{
                              final result = await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  allowedExtensions: ['png','jpg','jpeg', 'pdf']
                              );
                              if (result == null){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: TextView(text: 'No file selected.')));
                                return null;
                              }
                              setState((){
                                con.path = result.files.single.path;
                                con.fileName = result.files.single.name;
                                 pathLink = con.path;
                                 fileNam =con.fileName;
                                con.model.vehicleRegPath = con.path;
                                con.model.ownerCertPath = con.path;
                                con.model.insurPolPath = con.path;
                                con.model.driverLicPath = con.path;
                                con.isLoading= con.changeIconBool(vehicleRegPath: con.model.vehicleRegPath);
                                con.isLoading = con.changeIconBool1(ownershipCerti: con.model.ownerCertPath);
                                con.isLoading = con.changeIconBool2(riderLicense: con.model.driverLicPath);
                                con.isLoading = con.changeIconBool3(insurancePol: con.model.insurPolPath);
                                print(con.isLoading);

                              });
                              print("vehicle${con.model.vehicleRegPath}");
                              print("ownercert${con.model.ownerCertPath}");
                              print("insurpolpath${con.model.insurPolPath}");
                              print("driverlicpath${con.model.driverLicPath}");
                              print("how are you ${con.changeIconBool(vehicleRegPath: pathLink)}");
                              con.uploadDoc(pathLink!, fileNam, iconLoading).then((value) => print('done'));

                            },
                            child: TextView(
                              text: text!,
                              fontSize: 15.sp,
                              color: AppColor.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                            SizedBox(width: 50.w,),
                          con.isLoading ? SpinKitDoubleBounce(
                            color: AppColor.primary50,
                            size: 40.0.h,
                          ): SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 22.w,
            ),
            SvgPicture.asset('assets/svg/download_vehicle_icon.svg')
          ],
        ),
      );



}
