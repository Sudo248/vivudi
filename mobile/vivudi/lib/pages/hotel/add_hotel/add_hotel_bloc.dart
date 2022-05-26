import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:vivudi/model/hotel/hotel_request.dart';
import 'package:vivudi/repositories/hotel_repository.dart';

import '../../../base/bloc_base.dart';
import '../../../config/constant.dart';
import '../../../model/hotel/hotel_response.dart';

class AddHotelBloc extends BlocBase {
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    Constant.resetHotel();
  }

  void back() => navigator.back();

  void createHotel() async {
    log(Constant.price.toString());
    HotelResponse resp = await GetIt.I<HotelRepository>().createHotel(
      HotelRequest(
        image: Constant.image,
        roomType: Constant.roomType,
        address: Constant.address,
        description: Constant.description,
        numberBedrooms: Constant.numberBedrooms,
        numberBathrooms: Constant.numberBathrooms,
        amenities: Constant.amenities,
        price: Constant.price,
      ),
    );
    if (resp.success) {
      Constant.resetHotel();
      navigator.back();
    }
  }
}
