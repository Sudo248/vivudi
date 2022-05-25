import 'package:vivudi/model/hotel/hotel.dart';

class HotelResponse{
  bool success;
  Hotel? hotel;
  String? error;

//<editor-fold desc="Data Methods">

  HotelResponse({
    required this.success,
    this.hotel,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HotelResponse &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          hotel == other.hotel &&
          error == other.error);

  @override
  int get hashCode => success.hashCode ^ hotel.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'HotelDetailResponse{ success: $success, hotel: $hotel, error: $error,}';
  }

  HotelResponse copyWith({
    bool? success,
    Hotel? hotel,
    String? error,
  }) {
    return HotelResponse(
      success: success ?? this.success,
      hotel: hotel ?? this.hotel,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': this.success,
      'hotel': this.hotel,
      'error': this.error,
    };
  }

  factory HotelResponse.fromMap(Map<String, dynamic> map) {
    return HotelResponse(
      success: map['success'] as bool,
      hotel: map['hotel'] != null ? Hotel.fromMap(map['hotel']): null,
      error: map['error'] as String,
    );
  }

//</editor-fold>
}