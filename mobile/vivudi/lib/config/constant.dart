import '../model/hotel/hotel.dart';

abstract class Constant {
  /// URL
  static const baseUrl = "http://192.168.1.18:5000";
  static const api = "/api/v1";

  static const userUrl = "$api/user";
  static const loginUrl = "$api/auth/login";
  static const getMeUrl = "$userUrl/me";
  static const getHotels = "$userUrl/hotels";

  static const hotelUrl = "$api/hotel";
  static const getImge = "$api/image/";

  /// APP
  static const token = 'token';

  static const upload = '$api/image/upload';

  // Info of current Hotel
  static String id = '';
  static String image = '';
  static String roomType = '';
  static String address = '';
  static String description = '';
  static int numberBedrooms = 0;
  static int numberBathrooms = 0;
  static List<bool> amenities =
      List.generate(4, (index) => index == 0 ? true : false);
  static double price = 13000;

  static void resetHotel() {
    Constant.id = '';
    Constant.roomType = '';
    Constant.image = '';
    Constant.address = '';
    Constant.description = '';
    Constant.numberBedrooms = 0;
    Constant.numberBathrooms = 0;
    Constant.amenities = List.generate(4, (index) => index == 0 ? true : false);
    Constant.price = 13000;
  }

  static void setHotel(
      String id,
      String image,
      String roomType,
      String address,
      String description,
      int numberBedrooms,
      int numberBathrooms,
      List<bool> amentities,
      double price) {
    Constant.id = id;
    Constant.roomType = roomType;
    Constant.image = image;
    Constant.address = address;
    Constant.description = description;
    Constant.numberBedrooms = numberBedrooms;
    Constant.numberBathrooms = numberBathrooms;
    Constant.amenities = amentities;
    Constant.price = price;
  }
}
