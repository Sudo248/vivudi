abstract class Constant{
  /// URL
  static const baseUrl = "http://127.0.0.1:5000";
  static const api = "/api/v1";

  static const userUrl = "$api/user";
  static const loginUrl = "$userUrl/login";
  static const getMeUrl = "$userUrl/me";
  static const getHotels = "$userUrl/hotels";

  static const hotelUrl = "$api/hotel";

  /// APP
  static const token = 'token';

}