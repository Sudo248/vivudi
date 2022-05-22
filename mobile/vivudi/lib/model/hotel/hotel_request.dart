class HotelRequest{
  String image;
  String roomType;
  String address;
  String description;
  int numberBedrooms;
  int numberBathrooms;
  List<bool> amenities;
  double price;

//<editor-fold desc="Data Methods">

  HotelRequest({
    required this.image,
    required this.roomType,
    required this.address,
    required this.description,
    required this.numberBedrooms,
    required this.numberBathrooms,
    required this.amenities,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HotelRequest &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          roomType == other.roomType &&
          address == other.address &&
          description == other.description &&
          numberBedrooms == other.numberBedrooms &&
          numberBathrooms == other.numberBathrooms &&
          amenities == other.amenities &&
          price == other.price);

  @override
  int get hashCode =>
      image.hashCode ^
      roomType.hashCode ^
      address.hashCode ^
      description.hashCode ^
      numberBedrooms.hashCode ^
      numberBathrooms.hashCode ^
      amenities.hashCode ^
      price.hashCode;

  @override
  String toString() {
    return 'HotelRequest{ image: $image, roomType: $roomType, address: $address, description: $description, numberBedrooms: $numberBedrooms, numberBathrooms: $numberBathrooms, amenities: $amenities, price: $price,}';
  }

  HotelRequest copyWith({
    String? image,
    String? roomType,
    String? address,
    String? description,
    int? numberBedrooms,
    int? numberBathrooms,
    List<bool>? amenities,
    double? price,
  }) {
    return HotelRequest(
      image: image ?? this.image,
      roomType: roomType ?? this.roomType,
      address: address ?? this.address,
      description: description ?? this.description,
      numberBedrooms: numberBedrooms ?? this.numberBedrooms,
      numberBathrooms: numberBathrooms ?? this.numberBathrooms,
      amenities: amenities ?? this.amenities,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': this.image,
      'roomType': this.roomType,
      'address': this.address,
      'description': this.description,
      'numberBedrooms': this.numberBedrooms,
      'numberBathrooms': this.numberBathrooms,
      'amenities': this.amenities,
      'price': this.price,
    };
  }

  factory HotelRequest.fromMap(Map<String, dynamic> map) {
    return HotelRequest(
      image: map['image'] as String,
      roomType: map['roomType'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      numberBedrooms: map['numberBedrooms'] as int,
      numberBathrooms: map['numberBathrooms'] as int,
      amenities: map['amenities'] as List<bool>,
      price: map['price'] as double,
    );
  }

//</editor-fold>
}