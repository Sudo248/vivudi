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
  void onDispose() {
    hotels.close();
    noHotels.close();
  }

  @override
  void onInit() {
    loadData();
  }

  BehaviorSubject<List<Hotel>> hotels = BehaviorSubject();
  BehaviorSubject<int> noHotels = BehaviorSubject();

  Future<void> loadData() async {
    HotelsResponse resp = await GetIt.I<UserRepository>().getHotels();
    if (resp.success == true) {
      print(resp.hotels);
      noHotels.sink.add(resp.hotels!.length);
      hotels.sink.add(resp.hotels!);
    }
  }

  void showDetailRoom(Hotel hotel) async {
    await navigator.navigateTo(AppRoute.detailRoom, arguments: hotel.id);
    Future.delayed(const Duration(seconds: 1));
    loadData();
  }

  Future<List<Hotel>> getSuggestions(String pattern) async {
    return hotels.value
        .where((element) => element.roomType.contains(pattern))
        .toList();
  }
}
