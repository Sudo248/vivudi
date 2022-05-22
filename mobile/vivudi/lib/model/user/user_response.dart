class UserResponse{
  bool success;
  String? id;
  DateTime? createAt;
  String? firstName;
  String? lastName;
  String? avatar;
  String? error;

//<editor-fold desc="Data Methods">

  UserResponse({
    required this.success,
    this.id,
    this.createAt,
    this.firstName,
    this.lastName,
    this.avatar,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserResponse &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          id == other.id &&
          createAt == other.createAt &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          avatar == other.avatar &&
          error == other.error);

  @override
  int get hashCode =>
      success.hashCode ^
      id.hashCode ^
      createAt.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      avatar.hashCode ^
      error.hashCode;

  @override
  String toString() {
    return 'UserResponse{ success: $success, id: $id, createAt: $createAt, firstName: $firstName, lastName: $lastName, avatar: $avatar, error: $error,}';
  }

  UserResponse copyWith({
    bool? success,
    String? id,
    DateTime? createAt,
    String? firstName,
    String? lastName,
    String? avatar,
    String? error,
  }) {
    return UserResponse(
      success: success ?? this.success,
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'id': id,
      'createAt': createAt,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'error': error,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      success: map['success'] as bool,
      id: map['id'] as String?,
      createAt: map['createAt'] as DateTime?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      avatar: map['avatar'] as String?,
      error: map['error'] as String?,
    );
  }

//</editor-fold>
}