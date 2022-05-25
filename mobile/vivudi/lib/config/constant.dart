abstract class Constant{
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

}