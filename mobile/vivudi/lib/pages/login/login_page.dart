import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vivudi/base/page_base.dart';
import 'package:vivudi/components/button.dart';
import 'package:vivudi/components/edit_text.dart';
import 'package:vivudi/resources/app_assets.dart';
import 'package:vivudi/resources/app_color.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = LoginBloc();
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = bloc.globalData.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * 0.1,
                    left: size.width * 0.15,
                    child: Text(
                      "VIVUDI",
                      style: bloc.globalData.textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    bottom: 10,
                    child: Transform.rotate(
                      angle: 44.5,
                      child: Image.asset(
                        AppAssets.imgLauncher,
                        scale: 1.5,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -50,
                    bottom: 15,
                    child: Transform.rotate(
                      angle: -44.5,
                      child: Image.asset(
                        AppAssets.imgLauncher,
                        scale: 0.9,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Welcome Back!",
                    style: bloc.globalData.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  EditText(
                    controller: bloc.emailCtrl,
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  EditText(
                    controller: bloc.passwordCtrl,
                    labelText: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Button(
                    onPressed: bloc.login,
                    primary: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                    size: Size(size.height*0.6, 50),
                    child: Text(
                      "Sign In",
                      style: bloc.globalData.textTheme.headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    bloc.onInit();
    super.initState();
  }

  @override
  void dispose() {
    bloc.onDispose();
    super.dispose();
  }
}
