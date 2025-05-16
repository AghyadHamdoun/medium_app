import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';





mixin BaseMixin {
  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value,
        style: TextStyle(
          fontSize: 14.sp
           ),
          ),
      ),
    );
  }

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String msg,
    String? positiveBtn,
    String? negativeBtn,
    VoidCallback? positivePressed,
    VoidCallback? negativePressed,
    bool cancelable=true
  }) async {
    Platform.isAndroid
        ? showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: AlertDialog(
                  title: Center(child: Text(title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700
                  ),
                  )),
                  content: Text(msg,
                    style: TextStyle(
                        fontSize: 14.sp
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: negativeBtn != null
                      ? <Widget>[
                          TextButton(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,style: TextStyle(
                                fontSize: 14.sp
                              ),)),
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "ok".tr(),
                               style: TextStyle(fontSize: 14.sp),
                              )),
                        ]
                      : <Widget>[
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "ok".tr(),
                              style: TextStyle(fontSize: 14.sp),
                              )),
                        ],
                ),
              );
            },
          )
        : showCupertinoDialog(
            context: context,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: CupertinoAlertDialog(
                  title: Text(title),
                  content: Text(msg),
                  actions: negativeBtn != null
                      ? <Widget>[
                          CupertinoDialogAction(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,
                               style: TextStyle(
                                   fontSize: 14.sp
                               ),
                              )),
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "ok".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ]
                      : <Widget>[
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? "ok".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ],
                ),
              );
            });
  }

  void showLoadingDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              backgroundColor: Colors.white,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // The loading indicator
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Some text
                    Text("loading".tr(),
                      style: TextStyle(
                          fontSize: 14.sp
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void hideLoadingDialog(BuildContext context) async {
    Navigator.of(context).pop();
  }

  String getFormattedNumber(var number, BuildContext context) {
    number = double.parse(number.toString());
    var formatter = NumberFormat.decimalPattern("en_US");
    String num = convertYear2Ar(formatter.format(number), context);
    return num;
  }


  Future<void> changeLanguage(BuildContext context) async {
    if (Localizations.localeOf(context).languageCode == 'en') {
    //  await context.setLocale(Locale('ar'));
      await context.setLocale(const Locale('en'));

    } else {
      await context.setLocale(const Locale('en'));
    }
  }

  bool isArabic(BuildContext context) {
    return (Localizations.localeOf(context).languageCode == 'ar');
  }

  List<String> splitYearMonth(BuildContext context, String date, bool short) {
    String dateWith = '${date.substring(0, 4)}-${date.substring(4)}';

//   DateTime dateTime = DateTime.parse(dateWith);

    DateTime tempDate = DateFormat("yyyy-MM").parse(dateWith);

    String formattedDate;
    if (short) {
      formattedDate = DateFormat('yyyy-MMM').format(tempDate);
    } else {
      formattedDate = DateFormat('yyyy-MMMM').format(tempDate);
    }

    List<String> yearMonth = formattedDate.split('-');

    return [
      convertYear2Ar(yearMonth[0], context),
      getMonthName(yearMonth[1], context)
    ];
  }

  String getFormattedDate(String date, {String? inputFormat, outputFormat}) {
    if (date == "") {
      return "";
    }
    outputFormat ??= 'MMM-dd, yyyy';
    inputFormat ??= "yyyy-MM-dd HH:mm:ss.S";
    DateTime tempDate = DateFormat(inputFormat,'en').parse(date);
    String formattedDate = DateFormat(outputFormat,'en').format(tempDate);

    return formattedDate;
  }

  String getMonthName(String str, BuildContext context) {
    bool isAr = isArabic(context);
    if (!isAr) {
      return str;
    }
    str = str.toLowerCase();

    if (str.contains("jan")) {
      return "يناير";
    } else if (str.contains("feb")) {
      return "فبراير";
    } else if (str.contains("mar")) {
      return "مارس";
    } else if (str.contains("apr")) {
      return "إبريل";
    } else if (str.contains("may")) {
      return "مايو";
    } else if (str.contains("jun")) {
      return "يونيو";
    } else if (str.contains("jul")) {
      return "يوليو";
    } else if (str.contains("aug")) {
      return "أغسطس";
    } else if (str.contains("sep")) {
      return "سبتمبر";
    } else if (str.contains("oct")) {
      return "أكتوبر";
    } else if (str.contains("nov")) {
      return "نوفمبر";
    } else if (str.contains("dec")) {
      return "ديسمبر";
    }
    return str;
  }

  String convertYear2Ar(String input, BuildContext context) {
    if (isArabic(context)) {
      input = input
          .replaceAll("1", "١")
          .replaceAll("2", "٢")
          .replaceAll("3", "٣")
          .replaceAll("4", "٤")
          .replaceAll("5", "٥")
          .replaceAll("6", "٦")
          .replaceAll("7", "٧")
          .replaceAll("8", "٨")
          .replaceAll("9", "٩")
          .replaceAll("0", "٠");
    }

    return input;
  }





  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}
