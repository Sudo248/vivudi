import 'hotel.dart';

class HotelsResponse {
  bool success;
  List<Hotel>? hotels;
  String? error;

//<editor-fold desc="Data Methods">

  HotelsResponse({
    required this.success,
    this.hotels,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HotelsResponse &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          hotels == other.hotels &&
          error == other.error);

  @override
  int get hashCode => success.hashCode ^ hotels.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'HotelsResponse{ success: $success, hotels: $hotels, error: $error,}';
  }

  HotelsResponse copyWith({
    bool? success,
    List<Hotel>? hotels,
    String? error,
  }) {
    return HotelsResponse(
      success: success ?? this.success,
      hotels: hotels ?? this.hotels,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': this.success,
      'hotels': this.hotels,
      'error': this.error,
    };
  }

  factory HotelsResponse.fromMap(Map<String, dynamic> map) {
    try {
      dynamic hotels = map['hotels'];
      if (hotels != null) {
        hotels = (hotels as List).map((e) => Hotel.fromMap(e)).toList();
      }
      return HotelsResponse(
        success: map['success'] as bool,
        hotels: hotels,
        error: map['error'] as String?,
      );
    } catch (e) {
      return HotelsResponse(success: false, error: e.toString());
    }
  }

//</editor-fold>
}
