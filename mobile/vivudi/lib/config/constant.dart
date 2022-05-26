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

  /// APP
  static const token = 'token';

  static const upload = '$api/image/upload';

  // Info of current Hotel
  static String id = '';
  static String image =
      'https://chefjob.vn/wp-content/uploads/2020/04/homestay-duoc-nhieu-du-khach-lua-chon.jpg';
  static String roomType = '';
  static String address = '';
  static String description = '';
  static int numberBedrooms = 0;
  static int numberBathrooms = 0;
  static List<bool> amenities = List.generate(4, (index) => false);
  static double price = 13000;
}
