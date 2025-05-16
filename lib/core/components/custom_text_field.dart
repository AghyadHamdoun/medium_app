import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../core/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final List<String? Function(String?)> validators;

  const CustomTextField({
    required this.name,
    required this.labelText,
    required this.hintText,
     this.icon,
    this.obscureText = false,
    required this.validators,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        FormBuilderTextField(
          name: name,
          obscureText: obscureText,
          enableSuggestions: !obscureText,
          autocorrect: !obscureText,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.whiteColor,
          ),
          decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(vertical: 5, horizontal: 10),
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColor.hintText,
              fontSize: 14.sp,
            ),
            icon:icon != null? Icon(
              icon,
              size: 20.r,
              color: AppColor.whiteColor,
            ):SizedBox(width: 20.r,),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.whiteColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.whiteColor),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.whiteColor),
            ),
          ),
          validator: FormBuilderValidators.compose(validators),
        ),
      ],
    );
  }
}
