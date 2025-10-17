class UserResponse {
  final int status;
  final String message;
  final List<UserData> data;



  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => UserData.fromJson(item))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class UserData {
  final String id;
  final String fullName;
  final String regCode;
  final String countryId;
  final String stateId;
  final String mobile;
  final String profileImage;
  final String emailId;
  final String currency;
  final String joinDate;
  final String? activationDate;
  final String? activationKey;
  final String joinSource;
  final String usedLinkForRegistration;
  final String spRegId;
  final String deviceId;
  final String wDeviceId;
  final String wPlatform;
  final String spRegCode;
  final String defaultLang;
  final String username;
  final String encrPassword;
  final String pwd;
  final String? gdriveFileid;
  final String uniqueDeviceId;
  final String memberStatus;
  final String resellingPartner;
  final String coupon;
  final String coupStus;
  final String? currentAppVersion;
  final String? phoneType;
  final String driveMailId;
  final String serverbackupFileid;
  final String mathsTrialNumber;
  final String mathsTrialStatus;
  final String linkActive;
  final String wTotalPts;
  final String wRedeemedPts;
  final String wBalancePts;
  final String cartWithdrawPts;

  UserData({
    required this.id,
    required this.fullName,
    required this.regCode,
    required this.countryId,
    required this.stateId,
    required this.mobile,
    required this.profileImage,
    required this.emailId,
    required this.currency,
    required this.joinDate,
    required this.activationDate,
    required this.activationKey,
    required this.joinSource,
    required this.usedLinkForRegistration,
    required this.spRegId,
    required this.deviceId,
    required this.wDeviceId,
    required this.wPlatform,
    required this.spRegCode,
    required this.defaultLang,
    required this.username,
    required this.encrPassword,
    required this.pwd,
    required this.gdriveFileid,
    required this.uniqueDeviceId,
    required this.memberStatus,
    required this.resellingPartner,
    required this.coupon,
    required this.coupStus,
    required this.currentAppVersion,
    required this.phoneType,
    required this.driveMailId,
    required this.serverbackupFileid,
    required this.mathsTrialNumber,
    required this.mathsTrialStatus,
    required this.linkActive,
    required this.wTotalPts,
    required this.wRedeemedPts,
    required this.wBalancePts,
    required this.cartWithdrawPts,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? '',
      regCode: json['reg_code'] ?? '',
      countryId: json['country_id'] ?? '',
      stateId: json['state_id'] ?? '',
      mobile: json['mobile'] ?? '',
      profileImage: json['profile_image'] ?? '',
      emailId: json['email_id'] ?? '',
      currency: json['currency'] ?? '',
      joinDate: json['join_date'] ?? '',
      activationDate: json['activation_date'],
      activationKey: json['activation_key'],
      joinSource: json['join_source'] ?? '',
      usedLinkForRegistration: json['used_link_for_registration'] ?? '',
      spRegId: json['sp_reg_id'] ?? '',
      deviceId: json['device_id'] ?? '',
      wDeviceId: json['w_device_id'] ?? '',
      wPlatform: json['w_platform'] ?? '',
      spRegCode: json['sp_reg_code'] ?? '',
      defaultLang: json['default_lang'] ?? '',
      username: json['username'] ?? '',
      encrPassword: json['encr_password'] ?? '',
      pwd: json['pwd'] ?? '',
      gdriveFileid: json['gdrive_fileid'],
      uniqueDeviceId: json['unique_deviceId'] ?? '',
      memberStatus: json['member_status'] ?? '',
      resellingPartner: json['reselling_partner'] ?? '',
      coupon: json['coupon'] ?? '',
      coupStus: json['coup_stus'] ?? '',
      currentAppVersion: json['current_app_version'],
      phoneType: json['phone_type'],
      driveMailId: json['drive_mailId'] ?? '',
      serverbackupFileid: json['serverbackup_fileid'] ?? '',
      mathsTrialNumber: json['maths_trial_number'] ?? '',
      mathsTrialStatus: json['maths_trial_status'] ?? '',
      linkActive: json['link_active'] ?? '',
      wTotalPts: json['w_total_pts'] ?? '',
      wRedeemedPts: json['w_redeemed_pts'] ?? '',
      wBalancePts: json['w_balance_pts'] ?? '',
      cartWithdrawPts: json['cart_withdraw_pts'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'reg_code': regCode,
      'country_id': countryId,
      'state_id': stateId,
      'mobile': mobile,
      'profile_image': profileImage,
      'email_id': emailId,
      'currency': currency,
      'join_date': joinDate,
      'activation_date': activationDate,
      'activation_key': activationKey,
      'join_source': joinSource,
      'used_link_for_registration': usedLinkForRegistration,
      'sp_reg_id': spRegId,
      'device_id': deviceId,
      'w_device_id': wDeviceId,
      'w_platform': wPlatform,
      'sp_reg_code': spRegCode,
      'default_lang': defaultLang,
      'username': username,
      'encr_password': encrPassword,
      'pwd': pwd,
      'gdrive_fileid': gdriveFileid,
      'unique_deviceId': uniqueDeviceId,
      'member_status': memberStatus,
      'reselling_partner': resellingPartner,
      'coupon': coupon,
      'coup_stus': coupStus,
      'current_app_version': currentAppVersion,
      'phone_type': phoneType,
      'drive_mailId': driveMailId,
      'serverbackup_fileid': serverbackupFileid,
      'maths_trial_number': mathsTrialNumber,
      'maths_trial_status': mathsTrialStatus,
      'link_active': linkActive,
      'w_total_pts': wTotalPts,
      'w_redeemed_pts': wRedeemedPts,
      'w_balance_pts': wBalancePts,
      'cart_withdraw_pts': cartWithdrawPts,
    };
  }
}
