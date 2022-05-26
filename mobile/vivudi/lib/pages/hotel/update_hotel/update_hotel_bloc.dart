import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/config/constant.dart';
import 'package:vivudi/model/hotel/hotel_request.dart';
import 'package:vivudi/model/hotel/hotel_response.dart';
import 'package:vivudi/repositories/hotel_repository.dart';

class UpdateHotelBloc extends BlocBase {
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }

  void back() => navigator.back();

  void update() async {
    HotelResponse resp = await GetIt.I<HotelRepository>().updateHotel(
      Constant.id,
      HotelRequest(
          image: Constant.image,
          roomType: Constant.roomType,
          address: Constant.address,
          description: Constant.description,
          numberBedrooms: Constant.numberBedrooms,
          numberBathrooms: Constant.numberBathrooms,
          amenities: Constant.amenities,
          price: Constant.price),
    );
    if (resp.success){
      Constant.resetHotel();
      navigator.back();
    }
  }
}
