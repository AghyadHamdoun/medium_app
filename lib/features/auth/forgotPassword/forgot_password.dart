
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';
import '../login/presentation/ui/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.5.sh,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  height: 0.5.sh,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45.r),
                          topLeft: Radius.circular(45.r)),
                      color: AppColor.primaryColor),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot your password?".tr(),
                          style: TextStyle(
                              fontSize: 26.sp,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Email:".tr(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          height: 50.h,
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 16.sp, color: AppColor.whiteColor),
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 5.h, bottom: 10.h, right: 5.w, left: 5.w),
                              hintText: "enter your email".tr(),
                              hintStyle: TextStyle(
                                color: AppColor.hintText,
                                fontSize: 14.sp,
                              ),
                              icon: Icon(
                                Icons.email,
                                size: 20.r,
                                color: AppColor.whiteColor,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.whiteColor)),
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.whiteColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return tr(
                                  'Enter a valid email'.tr(),
                                );
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "do you have an account?".tr(),
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColor.whiteColor),
                            ),SizedBox(width: 5.w,),InkWell(
                              onTap: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()));},
                              child: Text(
                                "login".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp, color: AppColor.whiteColor,fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (){},
                            child: Container(height: 50.h,width:200.w,alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.circular(15.r)
                              ),
                              child: Text('Enter'.tr(),style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold
                              ),),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
