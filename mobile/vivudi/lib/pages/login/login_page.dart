import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vivudi/base/page_base.dart';
import 'package:vivudi/resources/app_color.dart';

import 'login_bloc.dart';

class LoginPage extends PageBase<LoginBloc>{

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
    );
  }

}