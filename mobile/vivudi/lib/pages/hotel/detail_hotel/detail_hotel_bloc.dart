import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/model/hotel/hotel_response.dart';
import 'package:vivudi/repositories/hotel_repository.dart';

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

  Future<Hotel?> getRoomById(String id) async {
    HotelResponse resp = await GetIt.I<HotelRepository>().getHotel(id);
    if (resp.success == true) {
      return resp.hotel;
    } else {
      return null;
    }
  }
  
}
