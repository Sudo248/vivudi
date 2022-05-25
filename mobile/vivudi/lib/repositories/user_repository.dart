import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/model/login/login_response.dart';

import '../model/hotel/hotels_response.dart';
import '../model/login/login_request.dart';
import '../model/user/user_response.dart';
import '../service/network_service.dart';

class UserRepository{
  final NetworkService networkService;
  final Future<SharedPreferences> fPref = SharedPreferences.getInstance();
  UserRepository({required this.networkService});

  Future<LoginResponse> login(LoginRequest request) async{
    try{
        final response = await networkService.post(Constant.loginUrl, data: request.toMap());
        final loginResponse = LoginResponse.fromMap(response.data);
        if(loginResponse.success){
          await (await fPref).setString(Constant.token, loginResponse.token!);
          networkService.headers["Authorization"] = "Bearer ${loginResponse.token}";
        }
        return loginResponse;
    }catch(e){
      return LoginResponse(success: false, error: e.toString());
    }
  }

  Future<UserResponse> getMe() async{
    try{
      networkService.headers["Authorization"] = "Bearer ${(await fPref).getString(Constant.token)}";
      final response = await networkService.get(Constant.getMeUrl);
      final userResponse = UserResponse.fromMap(response.data);
      return userResponse;
    }catch(e){
      return UserResponse(success: false, error: e.toString());
    }
  }

  Future<HotelsResponse> getHotels() async{
    try{
      networkService.headers["Authorization"] = "Bearer ${(await fPref).getString(Constant.token)}";
      final response = await networkService.get(Constant.getHotels);
      final hotelsResponse = HotelsResponse.fromMap(response.data);
      return hotelsResponse;
    }catch(e){
      return HotelsResponse(success: false, error: e.toString());
    }
  }

  Future<void> logout() async{
    await (await fPref).setString(Constant.token, "");
  }


}