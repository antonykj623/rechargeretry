import 'dart:convert';

class PointsEntity {
  int? status;
  String? message;
  List<PointsData>? data;

  PointsEntity({
    this.status,
    this.message,
    this.data,
  });

  // Deserialize from JSON
  factory PointsEntity.fromJson(Map<String, dynamic> json) {
    return PointsEntity(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PointsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }

  // Copy method (similar to Parcelable copy)
  PointsEntity copyWith({
    int? status,
    String? message,
    List<PointsData>? data,
  }) {
    return PointsEntity(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  String toString() => jsonEncode(toJson());
}

class PointsData {
  String? id;
  String? regId;
  String? credit;
  String? debit;
  String? balance;
  String? insDate;
  String? description;

  PointsData({
    this.id,
    this.regId,
    this.credit,
    this.debit,
    this.balance,
    this.insDate,
    this.description,
  });

  factory PointsData.fromJson(Map<String, dynamic> json) {
    return PointsData(
      id: json['id'] as String?,
      regId: json['reg_id'] as String?,
      credit: json['credit'] as String?,
      debit: json['debit'] as String?,
      balance: json['balance'] as String?,
      insDate: json['ins_date'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reg_id': regId,
      'credit': credit,
      'debit': debit,
      'balance': balance,
      'ins_date': insDate,
      'description': description,
    };
  }

  PointsData copyWith({
    String? id,
    String? regId,
    String? credit,
    String? debit,
    String? balance,
    String? insDate,
    String? description,
  }) {
    return PointsData(
      id: id ?? this.id,
      regId: regId ?? this.regId,
      credit: credit ?? this.credit,
      debit: debit ?? this.debit,
      balance: balance ?? this.balance,
      insDate: insDate ?? this.insDate,
      description: description ?? this.description,
    );
  }

  @override
  String toString() => jsonEncode(toJson());
}
