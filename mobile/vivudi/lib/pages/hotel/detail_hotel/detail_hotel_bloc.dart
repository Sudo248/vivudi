import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/config/constant.dart';
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
    
  }

  BehaviorSubject<Hotel> hotel = BehaviorSubject();

  void back() => navigator.back();

  Future<void> delete(String id) async {
    HotelResponse resp = await GetIt.I<HotelRepository>().deleteHotel(id);
    if (resp.success) {
      Constant.resetHotel();
      navigator.back();
    } else {}
  }

  Future<void> getRoomById(String id) async {
    HotelResponse resp = await GetIt.I<HotelRepository>().getHotel(id);
    if (resp.success) {
      Constant.setHotel(
          id,
          resp.hotel!.image,
          resp.hotel!.roomType,
          resp.hotel!.address,
          resp.hotel!.description,
          resp.hotel!.numberBedrooms,
          resp.hotel!.numberBathrooms,
          resp.hotel!.amenities,
          resp.hotel!.price);

      hotel.sink.add(resp.hotel!);
    }
  }

  void edit(String id) async {
    await navigator.navigateTo(AppRoute.updateHotel, arguments: id);
    getRoomById(id);
  }
}
