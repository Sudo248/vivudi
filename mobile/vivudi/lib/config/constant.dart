import '../model/hotel/hotel.dart';

abstract class Constant {
  /// URL
  static const baseUrl = "http://10.0.2.2:5000";
  static const api = "/api/v1";

  static const userUrl = "$api/user";
  static const loginUrl = "$api/auth/login";
  static const getMeUrl = "$userUrl/me";
  static const getHotels = "$userUrl/hotels";

  static const hotelUrl = "$api/hotel";

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
  static List<bool> amenities = [];
  static double price = 0.0;
}