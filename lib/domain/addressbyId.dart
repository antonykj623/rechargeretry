class ApiResponse {
  final int status;
  final String message;
  final UserData? data;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final String id;
  final String name;
  final String housename;
  final String flatno;
  final String userId;
  final String landmark;
  final String place;
  final String district;
  final String phone;
  final String pincode;
  final String state;
  final String country;

  UserData({
    required this.id,
    required this.name,
    required this.housename,
    required this.flatno,
    required this.userId,
    required this.landmark,
    required this.place,
    required this.district,
    required this.phone,
    required this.pincode,
    required this.state,
    required this.country,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      housename: json['housename'] ?? '',
      flatno: json['flatno'] ?? '',
      userId: json['user_id'] ?? '',
      landmark: json['landmark'] ?? '',
      place: json['place'] ?? '',
      district: json['district'] ?? '',
      phone: json['phone'] ?? '',
      pincode: json['pincode'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'housename': housename,
      'flatno': flatno,
      'user_id': userId,
      'landmark': landmark,
      'place': place,
      'district': district,
      'phone': phone,
      'pincode': pincode,
      'state': state,
      'country': country,
    };
  }
}
