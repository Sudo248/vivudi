import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/model/hotel/hotel.dart';
import 'package:vivudi/repositories/user_repository.dart';

import '../../model/hotel/hotel_response.dart';
import '../../model/hotel/hotels_response.dart';
import '../../routes/app_route.dart';

class HomeBloc extends BlocBase {
  @override
  void onDispose() {}

  @override
  void onInit() {}

  Future<List<Hotel>?> loadData() async {
    HotelsResponse resp = await GetIt.I<UserRepository>().getHotels();
    if (resp.success == true) {
      return resp.hotels;
    } else {
      return null;
    }
  }

  void showDetailRoom(Hotel hotel) {
    navigator.navigateTo(AppRoute.detailRoom);
  }
}
