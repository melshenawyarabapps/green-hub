class RegisterRequest {
  final String phone;
  final String otp;
  final String name;
  final String email;
  final String nationalId;
  final String licenseNumber;
  final String licenseExpiry;
  final String? faceImage;

  const RegisterRequest({
    required this.phone,
    required this.otp,
    required this.name,
    required this.email,
    required this.nationalId,
    required this.licenseNumber,
    required this.licenseExpiry,
    this.faceImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp': otp,
      'name': name,
      'email': email,
      'national_id': nationalId,
      'license_number': licenseNumber,
      'license_expiry': licenseExpiry,
      if (faceImage != null) 'face_image': faceImage,
    };
  }
}

