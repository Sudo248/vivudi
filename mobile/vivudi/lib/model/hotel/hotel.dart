class Hotel {
  String id;
  String image;
  String roomType;
  String address;
  String description;
  int numberBedrooms;
  int numberBathrooms;
  List<bool> amenities;
  double price;

//<editor-fold desc="Data Methods">

  Hotel({
    required this.id,
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
      (other is Hotel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
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
      id.hashCode ^
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
    return 'Hotel{ id: $id, image: $image, roomType: $roomType, address: $address, description: $description, numberBedrooms: $numberBedrooms, numberBathrooms: $numberBathrooms, amenities: $amenities, price: $price,}';
  }

  Hotel copyWith({
    String? id,
    String? image,
    String? roomType,
    String? address,
    String? description,
    int? numberBedrooms,
    int? numberBathrooms,
    List<bool>? amenities,
    double? price,
  }) {
    return Hotel(
      id: id ?? this.id,
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
      'id': id,
      'image': image,
      'roomType': roomType,
      'address': address,
      'description': description,
      'numberBedrooms': numberBedrooms,
      'numberBathrooms': numberBathrooms,
      'amenities': amenities,
      'price': price,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: (map['id'] ?? map['_id']) as String,
      image: map['image'] as String,
      roomType: map['roomType'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      numberBedrooms: map['numberBedrooms'] as int,
      numberBathrooms: map['numberBathrooms'] as int,
      amenities: (map['amenities'] as List).map((e) => (e as bool)).toList(),
      price: double.parse(map['price'].toString()),
    );
  }

//</editor-fold>
}
