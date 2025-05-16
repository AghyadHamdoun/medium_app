import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/enum/enums.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../injection.dart';
import '../../../../../pages/home/presentaion/ui/screens/home_page.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../bloc/auth_state.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc bloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.loginModel!.token!.isNotEmpty) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
                (route) => false,
          );
        } else if (state.loginMessage!.isNotEmpty) {
          showErrorDialog(context, state.loginMessage!);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.loginState == RequestState.loading,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const LoginHeader(),
                    LoginForm(bloc: bloc),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: tr('login error'),
      desc: message,
      btnCancelText: tr('ok'),
      btnCancelOnPress: () {},
      btnCancelColor: AppColor.primaryColor,
      btnOkColor: AppColor.primaryColor,
    ).show();
  }
}
