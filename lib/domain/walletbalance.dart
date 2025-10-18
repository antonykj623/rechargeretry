import 'dart:convert';

class WalletBalanceEntity {
  final int status;
  final String message;
  final WalletBalanceData? data;

  WalletBalanceEntity({
    this.status = 0,
    this.message = '',
    this.data,
  });

  // Factory constructor for creating from JSON
  factory WalletBalanceEntity.fromJson(Map<String, dynamic> json) {
    return WalletBalanceEntity(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? WalletBalanceData.fromJson(json['data'])
          : null,
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  // Encode to JSON string
  @override
  String toString() => jsonEncode(toJson());
}

class WalletBalanceData {
  final String id;
  final String userId;
  final String credit;
  final String debit;
  final String balance;
  final String transactionDate;

  WalletBalanceData({
    this.id = '',
    this.userId = '',
    this.credit = '',
    this.debit = '',
    this.balance = '0',
    this.transactionDate = '',
  });

  factory WalletBalanceData.fromJson(Map<String, dynamic> json) {
    return WalletBalanceData(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      credit: json['credit'] ?? '',
      debit: json['debit'] ?? '',
      balance: json['balance'] ?? '0',
      transactionDate: json['transaction_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'credit': credit,
    'debit': debit,
    'balance': balance,
    'transaction_date': transactionDate,
  };

  @override
  String toString() => jsonEncode(toJson());
}
