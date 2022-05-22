import 'package:vivudi/model/login/login_request.dart';

class LoginResponse{
  bool success;
  String? token;
  String? error;


  LoginResponse({
    required this.success,
    this.token,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginResponse &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          token == other.token &&
          error == other.error);

  @override
  int get hashCode => success.hashCode ^ token.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'LoginResponse{ success: $success, token: $token, error: $error,}';
  }

  LoginResponse copyWith({
    bool? success,
    String? token,
    String? error,
  }) {
    return LoginResponse(
      success: success ?? this.success,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'token': token,
      'error': error,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      success: map['success'] as bool,
      token: map['token'] as String?,
      error: map['error'] as String?,
    );
  }

}