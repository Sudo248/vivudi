import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/model/hotel/hotel_response.dart';
import 'package:vivudi/repositories/hotel_repository.dart';
import 'package:vivudi/routes/app_route.dart';
import 'package:vivudi/utils/dialog.dart';

import '../../../model/hotel/hotel.dart';

class DetailHotelBloc extends BlocBase {
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }
  void back() => navigator.back();

  Future<void> delete(String id) async {

    HotelResponse resp = await GetIt.I<HotelRepository>().deleteHotel(id);
    if (resp.success){
      navigator.back();
    } else {

    }
  }

  Future<Hotel?> getRoomById(String id) async {
    HotelResponse resp = await GetIt.I<HotelRepository>().getHotel(id);
    if (resp.success) {
      return resp.hotel;
    } else {
      return null;
    }
  }

  void edit(){
    navigator.navigateTo(AppRoute.updateHotel);
  }
}
