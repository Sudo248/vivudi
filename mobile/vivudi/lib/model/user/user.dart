import '../hotel/hotel.dart';

class User {
  String id;
  String? email;
  String? password;
  DateTime createAt;
  String firstName;
  String lastName;
  String avatar;
  List<Hotel>? hotels;


  User({
    required this.id,
    this.email,
    this.password,
    required this.createAt,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.hotels,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          password == other.password &&
          createAt == other.createAt &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          avatar == other.avatar &&
          hotels == other.hotels);

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      createAt.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      avatar.hashCode ^
      hotels.hashCode;

  @override
  String toString() {
    return 'User{ id: $id, email: $email, password: $password, createAt: $createAt, firstName: $firstName, lastName: $lastName, avatar: $avatar, hotels: $hotels,}';
  }

  User copyWith({
    String? id,
    String? email,
    String? password,
    DateTime? createAt,
    String? firstName,
    String? lastName,
    String? avatar,
    List<Hotel>? hotels,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createAt: createAt ?? this.createAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      hotels: hotels ?? this.hotels,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'createAt': createAt,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'hotels': hotels,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      createAt: map['createAt'] as DateTime,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      avatar: map['avatar'] as String,
      hotels: map['hotels'] as List<Hotel>,
    );
  }

}