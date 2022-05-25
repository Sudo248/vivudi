import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivudi/model/hotel/hotel_request.dart';

import '../config/constant.dart';
import '../model/hotel/hotel_response.dart';
import '../service/network_service.dart';

class HotelRepository {
  final NetworkService networkService;
  HotelRepository({required this.networkService}) {
    setHeader();
  }

  Future<void> setHeader() async {
    networkService.headers["Authorization"] =
        "Bearer ${(await SharedPreferences.getInstance()).getString(Constant.token)}";
  }

  Future<HotelResponse> createHotel(HotelRequest request) async {
    try {
      final response =
          await networkService.post(Constant.hotelUrl, data: request.toMap());
      final hotelResponse = HotelResponse.fromMap(response.data);
      return hotelResponse;
    } catch (e) {
      return HotelResponse(success: false, error: e.toString());
    }
  }

  Future<HotelResponse> getHotel(String id) async {
    try {
      final response = await networkService.get(
        "${Constant.hotelUrl}/$id",
      );
      print(response.data);
      final hotelResponse = HotelResponse.fromMap(response.data);
      return hotelResponse;
    } catch (e) {
      print(e);
      return HotelResponse(success: false, error: e.toString());
    }
  }

  Future<HotelResponse> updateHotel(String id, HotelRequest request) async {
    try {
      final response = await networkService.put('${Constant.hotelUrl}/$id',
          data: request.toMap());
      final hotelResponse = HotelResponse.fromMap(response.data);
      return hotelResponse;
    } catch (e) {
      return HotelResponse(success: false, error: e.toString());
    }
  }

  Future<HotelResponse> deleteHotel(String id) async {
    try {
      final response = await networkService
          .delete('${Constant.hotelUrl}/$id');

      final hotelResponse = HotelResponse.fromMap(response.data);
      return hotelResponse;
    } catch (e) {
      return HotelResponse(success: false, error: e.toString());
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      final response =
          await networkService.uploadImage(Constant.upload, image: image);
      if (response.data['success'] as bool) {
        return response.data['url'] as String;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
