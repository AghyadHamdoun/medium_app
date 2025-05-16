import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_generative_ai/google_generative_ai.dart ' as gemini;
import 'package:DevLogger/Preference.dart';
import 'package:DevLogger/core/theme/app_theme.dart';
import 'package:DevLogger/features/auth/login/presentation/ui/screens/login_screen.dart';
import 'features/splash/splash_screen.dart';
import 'injection.dart' as di;


void main()async {
  await di.init();
  await ScreenUtil.ensureScreenSize();
  await Preferences.init();
  Gemini.init(apiKey: 'AIzaSyDdNIZblXkXrVqRBPEsPXb8QfKW1a4PrB0');


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          builder: BotToastInit() ,
          navigatorObservers: [BotToastNavigatorObserver()],
          title: 'DevLogger App',
          theme: lightTheme(context),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}


