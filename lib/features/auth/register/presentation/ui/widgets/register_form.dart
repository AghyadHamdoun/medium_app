import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:DevLogger/features/auth/login/presentation/ui/screens/login_screen.dart';

import '../../../../../../core/components/custom_text_field.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../register/presentation/ui/screens/register.dart';

class RegisterForm extends StatelessWidget {
  final AuthBloc bloc;
  final _formKey = GlobalKey<FormBuilderState>();

  RegisterForm({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      height: 0.7.sh,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45.r),
          topLeft: Radius.circular(45.r),
        ),
        color: AppColor.blackColor.withOpacity(0.8),
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create new account.",
              style: TextStyle(
                fontSize: 26.sp,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            40.verticalSpace,
            CustomTextField(
              name: 'fullName',
              labelText: "Full Name:",
              hintText: "enter your name",
              icon: Icons.person,
              validators: [
                FormBuilderValidators.required(
                    errorText: 'Enter a valid name'),
              ],
            ),
            10.verticalSpace,
            CustomTextField(
              name: 'email',
              labelText: "Email:",
              hintText: "enter your email",
              icon: Icons.email,
              validators: [
                FormBuilderValidators.required(
                    errorText: 'Enter a valid email'),
                FormBuilderValidators.email(errorText: 'Enter a valid email'),
              ],
            ),
            10.verticalSpace,
            CustomTextField(
              name: 'password',
              labelText: "Password:",
              hintText: "Password",
              icon: Icons.lock,
              obscureText: true,
              validators: [
                FormBuilderValidators.required(errorText: 'Enter a password'),
                FormBuilderValidators.minLength(8,
                    errorText: 'Password is short'),
              ],
            ),
            10.verticalSpace,
            CustomTextField(
              name: 'passwordConfirmation',
              labelText: "Password Confirmation:",
              hintText: "confirm password",
              obscureText: true,
              validators: [
                FormBuilderValidators.required(errorText: 'Enter a password'),
                FormBuilderValidators.match(_formKey.currentState?.value['password'] ?? '',
                    errorText: 'Password is short'),
              ],
            ),
            10.verticalSpace,
            buildRegisterRow(context),
            10.verticalSpace,
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterRow(BuildContext context) {
    return Row(
      children: [
        Text(
          "Do you have an account?",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.whiteColor,
          ),
        ),
        SizedBox(width: 5.w),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: Text(
            "login",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            bloc.onLoginEvent(
              email: _formKey.currentState?.value['email'],
              password: _formKey.currentState?.value['password'],
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Incomplete data').tr()),
            );
          }
        },
        child: Container(
          height: 50.h,
          width: 200.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Text(
            'sign up' ,
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
