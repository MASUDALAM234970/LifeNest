// Models matching the real backend (lib/core/endpoints.dart)

class TokenModel {
  final String access;
  final String refresh;

  TokenModel({required this.access, required this.refresh});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      access: json['access'] ?? '',
      refresh: json['refresh'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'access': access,
    'refresh': refresh,
  };
}

class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

class UserRegistrationRequest {
  final String name;
  final String email;
  final String? dateOfBirth; // format: yyyy-MM-dd
  final String password;
  final String confirmPassword;

  UserRegistrationRequest({
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'date_of_birth': dateOfBirth,
    'password': password,
    'confirm_password': confirmPassword,
  };
}

/// Used both for signup email verification and for kicking off a
/// password reset — same "send-otp" endpoint on the backend.
class SendOtpRequest {
  final String email;
  SendOtpRequest({required this.email});
  Map<String, dynamic> toJson() => {'email': email};
}

class VerifyOtpRequest {
  final String email;
  final String otp;
  VerifyOtpRequest({required this.email, required this.otp});
  Map<String, dynamic> toJson() => {'email': email, 'otp': otp};
}

class ResetPasswordRequest {
  final String email;
  final String otp;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordRequest({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'otp': otp,
    'new_password': newPassword,
    'confirm_password': confirmPassword,
  };
}

