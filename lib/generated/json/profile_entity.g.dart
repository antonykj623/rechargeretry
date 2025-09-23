import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/dth_recharge/profile_entity.dart';

ProfileEntity $ProfileEntityFromJson(Map<String, dynamic> json) {
  final ProfileEntity profileEntity = ProfileEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    profileEntity.status = status;
  }
  final ProfileData? data = jsonConvert.convert<ProfileData>(json['data']);
  if (data != null) {
    profileEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    profileEntity.message = message;
  }
  return profileEntity;
}

Map<String, dynamic> $ProfileEntityToJson(ProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension ProfileEntityExtension on ProfileEntity {
  ProfileEntity copyWith({
    int? status,
    ProfileData? data,
    String? message,
  }) {
    return ProfileEntity()
      ..status = status ?? this.status
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

ProfileData $ProfileDataFromJson(Map<String, dynamic> json) {
  final ProfileData profileData = ProfileData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    profileData.id = id;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    profileData.fullName = fullName;
  }
  final String? regCode = jsonConvert.convert<String>(json['reg_code']);
  if (regCode != null) {
    profileData.regCode = regCode;
  }
  final String? countryId = jsonConvert.convert<String>(json['country_id']);
  if (countryId != null) {
    profileData.countryId = countryId;
  }
  final String? stateId = jsonConvert.convert<String>(json['state_id']);
  if (stateId != null) {
    profileData.stateId = stateId;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    profileData.mobile = mobile;
  }
  final String? profileImage = jsonConvert.convert<String>(
      json['profile_image']);
  if (profileImage != null) {
    profileData.profileImage = profileImage;
  }
  final String? emailId = jsonConvert.convert<String>(json['email_id']);
  if (emailId != null) {
    profileData.emailId = emailId;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    profileData.currency = currency;
  }
  final String? joinDate = jsonConvert.convert<String>(json['join_date']);
  if (joinDate != null) {
    profileData.joinDate = joinDate;
  }
  final String? activationDate = jsonConvert.convert<String>(
      json['activation_date']);
  if (activationDate != null) {
    profileData.activationDate = activationDate;
  }
  final dynamic activationKey = json['activation_key'];
  if (activationKey != null) {
    profileData.activationKey = activationKey;
  }
  final String? joinSource = jsonConvert.convert<String>(json['join_source']);
  if (joinSource != null) {
    profileData.joinSource = joinSource;
  }
  final String? usedLinkForRegistration = jsonConvert.convert<String>(
      json['used_link_for_registration']);
  if (usedLinkForRegistration != null) {
    profileData.usedLinkForRegistration = usedLinkForRegistration;
  }
  final String? spRegId = jsonConvert.convert<String>(json['sp_reg_id']);
  if (spRegId != null) {
    profileData.spRegId = spRegId;
  }
  final String? deviceId = jsonConvert.convert<String>(json['device_id']);
  if (deviceId != null) {
    profileData.deviceId = deviceId;
  }
  final String? wDeviceId = jsonConvert.convert<String>(json['w_device_id']);
  if (wDeviceId != null) {
    profileData.wDeviceId = wDeviceId;
  }
  final String? wPlatform = jsonConvert.convert<String>(json['w_platform']);
  if (wPlatform != null) {
    profileData.wPlatform = wPlatform;
  }
  final String? spRegCode = jsonConvert.convert<String>(json['sp_reg_code']);
  if (spRegCode != null) {
    profileData.spRegCode = spRegCode;
  }
  final String? defaultLang = jsonConvert.convert<String>(json['default_lang']);
  if (defaultLang != null) {
    profileData.defaultLang = defaultLang;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    profileData.username = username;
  }
  final String? encrPassword = jsonConvert.convert<String>(
      json['encr_password']);
  if (encrPassword != null) {
    profileData.encrPassword = encrPassword;
  }
  final dynamic pwd = json['pwd'];
  if (pwd != null) {
    profileData.pwd = pwd;
  }
  final String? gdriveFileid = jsonConvert.convert<String>(
      json['gdrive_fileid']);
  if (gdriveFileid != null) {
    profileData.gdriveFileid = gdriveFileid;
  }
  final String? uniqueDeviceid = jsonConvert.convert<String>(
      json['unique_deviceId']);
  if (uniqueDeviceid != null) {
    profileData.uniqueDeviceid = uniqueDeviceid;
  }
  final String? memberStatus = jsonConvert.convert<String>(
      json['member_status']);
  if (memberStatus != null) {
    profileData.memberStatus = memberStatus;
  }
  final String? resellingPartner = jsonConvert.convert<String>(
      json['reselling_partner']);
  if (resellingPartner != null) {
    profileData.resellingPartner = resellingPartner;
  }
  final String? coupon = jsonConvert.convert<String>(json['coupon']);
  if (coupon != null) {
    profileData.coupon = coupon;
  }
  final String? coupStus = jsonConvert.convert<String>(json['coup_stus']);
  if (coupStus != null) {
    profileData.coupStus = coupStus;
  }
  final String? currentAppVersion = jsonConvert.convert<String>(
      json['current_app_version']);
  if (currentAppVersion != null) {
    profileData.currentAppVersion = currentAppVersion;
  }
  final String? phoneType = jsonConvert.convert<String>(json['phone_type']);
  if (phoneType != null) {
    profileData.phoneType = phoneType;
  }
  final String? driveMailid = jsonConvert.convert<String>(json['drive_mailId']);
  if (driveMailid != null) {
    profileData.driveMailid = driveMailid;
  }
  final String? serverbackupFileid = jsonConvert.convert<String>(
      json['serverbackup_fileid']);
  if (serverbackupFileid != null) {
    profileData.serverbackupFileid = serverbackupFileid;
  }
  final String? mathsTrialNumber = jsonConvert.convert<String>(
      json['maths_trial_number']);
  if (mathsTrialNumber != null) {
    profileData.mathsTrialNumber = mathsTrialNumber;
  }
  final String? mathsTrialStatus = jsonConvert.convert<String>(
      json['maths_trial_status']);
  if (mathsTrialStatus != null) {
    profileData.mathsTrialStatus = mathsTrialStatus;
  }
  final String? linkActive = jsonConvert.convert<String>(json['link_active']);
  if (linkActive != null) {
    profileData.linkActive = linkActive;
  }
  final String? wTotalPts = jsonConvert.convert<String>(json['w_total_pts']);
  if (wTotalPts != null) {
    profileData.wTotalPts = wTotalPts;
  }
  final String? wRedeemedPts = jsonConvert.convert<String>(
      json['w_redeemed_pts']);
  if (wRedeemedPts != null) {
    profileData.wRedeemedPts = wRedeemedPts;
  }
  final String? wBalancePts = jsonConvert.convert<String>(
      json['w_balance_pts']);
  if (wBalancePts != null) {
    profileData.wBalancePts = wBalancePts;
  }
  final String? cartWithdrawPts = jsonConvert.convert<String>(
      json['cart_withdraw_pts']);
  if (cartWithdrawPts != null) {
    profileData.cartWithdrawPts = cartWithdrawPts;
  }
  return profileData;
}

Map<String, dynamic> $ProfileDataToJson(ProfileData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['full_name'] = entity.fullName;
  data['reg_code'] = entity.regCode;
  data['country_id'] = entity.countryId;
  data['state_id'] = entity.stateId;
  data['mobile'] = entity.mobile;
  data['profile_image'] = entity.profileImage;
  data['email_id'] = entity.emailId;
  data['currency'] = entity.currency;
  data['join_date'] = entity.joinDate;
  data['activation_date'] = entity.activationDate;
  data['activation_key'] = entity.activationKey;
  data['join_source'] = entity.joinSource;
  data['used_link_for_registration'] = entity.usedLinkForRegistration;
  data['sp_reg_id'] = entity.spRegId;
  data['device_id'] = entity.deviceId;
  data['w_device_id'] = entity.wDeviceId;
  data['w_platform'] = entity.wPlatform;
  data['sp_reg_code'] = entity.spRegCode;
  data['default_lang'] = entity.defaultLang;
  data['username'] = entity.username;
  data['encr_password'] = entity.encrPassword;
  data['pwd'] = entity.pwd;
  data['gdrive_fileid'] = entity.gdriveFileid;
  data['unique_deviceId'] = entity.uniqueDeviceid;
  data['member_status'] = entity.memberStatus;
  data['reselling_partner'] = entity.resellingPartner;
  data['coupon'] = entity.coupon;
  data['coup_stus'] = entity.coupStus;
  data['current_app_version'] = entity.currentAppVersion;
  data['phone_type'] = entity.phoneType;
  data['drive_mailId'] = entity.driveMailid;
  data['serverbackup_fileid'] = entity.serverbackupFileid;
  data['maths_trial_number'] = entity.mathsTrialNumber;
  data['maths_trial_status'] = entity.mathsTrialStatus;
  data['link_active'] = entity.linkActive;
  data['w_total_pts'] = entity.wTotalPts;
  data['w_redeemed_pts'] = entity.wRedeemedPts;
  data['w_balance_pts'] = entity.wBalancePts;
  data['cart_withdraw_pts'] = entity.cartWithdrawPts;
  return data;
}

extension ProfileDataExtension on ProfileData {
  ProfileData copyWith({
    String? id,
    String? fullName,
    String? regCode,
    String? countryId,
    String? stateId,
    String? mobile,
    String? profileImage,
    String? emailId,
    String? currency,
    String? joinDate,
    String? activationDate,
    dynamic activationKey,
    String? joinSource,
    String? usedLinkForRegistration,
    String? spRegId,
    String? deviceId,
    String? wDeviceId,
    String? wPlatform,
    String? spRegCode,
    String? defaultLang,
    String? username,
    String? encrPassword,
    dynamic pwd,
    String? gdriveFileid,
    String? uniqueDeviceid,
    String? memberStatus,
    String? resellingPartner,
    String? coupon,
    String? coupStus,
    String? currentAppVersion,
    String? phoneType,
    String? driveMailid,
    String? serverbackupFileid,
    String? mathsTrialNumber,
    String? mathsTrialStatus,
    String? linkActive,
    String? wTotalPts,
    String? wRedeemedPts,
    String? wBalancePts,
    String? cartWithdrawPts,
  }) {
    return ProfileData()
      ..id = id ?? this.id
      ..fullName = fullName ?? this.fullName
      ..regCode = regCode ?? this.regCode
      ..countryId = countryId ?? this.countryId
      ..stateId = stateId ?? this.stateId
      ..mobile = mobile ?? this.mobile
      ..profileImage = profileImage ?? this.profileImage
      ..emailId = emailId ?? this.emailId
      ..currency = currency ?? this.currency
      ..joinDate = joinDate ?? this.joinDate
      ..activationDate = activationDate ?? this.activationDate
      ..activationKey = activationKey ?? this.activationKey
      ..joinSource = joinSource ?? this.joinSource
      ..usedLinkForRegistration = usedLinkForRegistration ??
          this.usedLinkForRegistration
      ..spRegId = spRegId ?? this.spRegId
      ..deviceId = deviceId ?? this.deviceId
      ..wDeviceId = wDeviceId ?? this.wDeviceId
      ..wPlatform = wPlatform ?? this.wPlatform
      ..spRegCode = spRegCode ?? this.spRegCode
      ..defaultLang = defaultLang ?? this.defaultLang
      ..username = username ?? this.username
      ..encrPassword = encrPassword ?? this.encrPassword
      ..pwd = pwd ?? this.pwd
      ..gdriveFileid = gdriveFileid ?? this.gdriveFileid
      ..uniqueDeviceid = uniqueDeviceid ?? this.uniqueDeviceid
      ..memberStatus = memberStatus ?? this.memberStatus
      ..resellingPartner = resellingPartner ?? this.resellingPartner
      ..coupon = coupon ?? this.coupon
      ..coupStus = coupStus ?? this.coupStus
      ..currentAppVersion = currentAppVersion ?? this.currentAppVersion
      ..phoneType = phoneType ?? this.phoneType
      ..driveMailid = driveMailid ?? this.driveMailid
      ..serverbackupFileid = serverbackupFileid ?? this.serverbackupFileid
      ..mathsTrialNumber = mathsTrialNumber ?? this.mathsTrialNumber
      ..mathsTrialStatus = mathsTrialStatus ?? this.mathsTrialStatus
      ..linkActive = linkActive ?? this.linkActive
      ..wTotalPts = wTotalPts ?? this.wTotalPts
      ..wRedeemedPts = wRedeemedPts ?? this.wRedeemedPts
      ..wBalancePts = wBalancePts ?? this.wBalancePts
      ..cartWithdrawPts = cartWithdrawPts ?? this.cartWithdrawPts;
  }
}