import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/button_widget.dart';
import '../helper/const/widget/custom_appbar.dart';
import '../helper/const/widget/edit_form_text.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import '../profile/profile_screen.dart';

class RidersStepperScreen extends StatefulWidget {
  const RidersStepperScreen({Key? key}) : super(key: key);

  @override
  State<RidersStepperScreen> createState() => _RidersStepperScreenState();
}

class _RidersStepperScreenState extends State<RidersStepperScreen> {
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
                PageRouter.gotoWidget(const ProfileScreen(), context);
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
                      onPressed: details.onStepContinue,
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
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Last name',
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
                EditFormText(
                    isSignIn: true,
                    labelText: 'E-Mail',
                    padding: 0.r,
                    margin: 20.r,
                    fontsize: 16.sp),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Home Address',
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
                  height: 75.h,
                ),
                SvgPicture.asset('assets/svg/download_icon.svg'),
                SizedBox(
                  height: 20.h,
                ),
                ButtonWidget(
                  buttonText: 'Select document',
                  onPressed: () {},
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
                    isSignIn: true,
                    labelText: 'Vehicle Type',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Brand (Auto Suggestion)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Model (Auto suggestion)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Year (optional)',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Plate number*',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
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
                rowItem(text: 'Vehicle registration'),
                rowItem(text: 'Ownership certicate'),
                rowItem(text: 'Insurance policy'),
                rowItem(text: 'Driver/ rider license'),
              ],
            )),
        Step(
            isActive: currentStep >= 4,
            title: Container(),
            content: Column(
              children: [
                EditFormText(
                    isSignIn: true,
                    labelText: 'Bank Name',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Account Holder Name',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
                    isSignIn: true,
                    labelText: 'Account Number',
                    fontsize: 16.sp,
                    padding: 0.r,
                    margin: 20.r),
                EditFormText(
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

  rowItem({String? text}) => Container(
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
                  child: TextView(
                    text: text!,
                    fontSize: 15.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
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
