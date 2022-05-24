import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/model/login/login_request.dart';
import 'package:vivudi/repositories/user_repository.dart';

class LoginBloc extends BlocBase{

  final UserRepository userRepo = GetIt.I.get<UserRepository>();

  late final TextEditingController emailCtrl, passwordCtrl;


  LoginBloc(){
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }

  Future<void> login() async{
    LoginRequest request = LoginRequest(email: emailCtrl.text, password: passwordCtrl.text);
    final response = await userRepo.login(request);
    if(response.success){
      print("login success");
    }else{
      print("login error");
    }

  }

}