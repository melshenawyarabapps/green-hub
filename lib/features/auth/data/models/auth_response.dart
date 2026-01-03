class AuthResponse {
  final bool success;
  final String? message;
  final String? token;
  final UserData? user;

  const AuthResponse({
    required this.success,
    this.message,
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // Handle nested 'data' structure from API
    final data = json['data'] as Map<String, dynamic>?;

    return AuthResponse(
      success: json['success'] ?? (data != null),
      message: json['message'],
      token: data?['token'] ?? json['token'],
      user: data?['user'] != null
          ? UserData.fromJson(data!['user'])
          : (json['user'] != null ? UserData.fromJson(json['user']) : null),
    );
  }
}

class UserData {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? avatar;
  final String? rating;
  final int? totalRatings;
  final String? walletBalance;
  // Driver specific fields
  final String? nationalId;
  final String? licenseNumber;
  final String? licenseExpiry;
  final String? faceImage;

  const UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.avatar,
    this.rating,
    this.totalRatings,
    this.walletBalance,
    this.nationalId,
    this.licenseNumber,
    this.licenseExpiry,
    this.faceImage,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      avatar: json['avatar'],
      rating: json['rating'],
      totalRatings: json['total_ratings'],
      walletBalance: json['wallet_balance'],
      nationalId: json['national_id'],
      licenseNumber: json['license_number'],
      licenseExpiry: json['license_expiry'],
      faceImage: json['face_image'],
    );
  }
}

