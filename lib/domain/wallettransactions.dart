import 'dart:convert';

class WalletTransactionEntity {
  final int status;
  final String message;
  final List<WalletTransactionData> data;

  WalletTransactionEntity({
    this.status = 0,
    this.message = '',
    this.data = const [],
  });

  /// Factory constructor for parsing from JSON
  factory WalletTransactionEntity.fromJson(Map<String, dynamic> json) {
    return WalletTransactionEntity(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<WalletTransactionData>.from(
          json['data'].map((x) => WalletTransactionData.fromJson(x)))
          : [],
    );
  }

  /// Convert object to JSON map
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.map((x) => x.toJson()).toList(),
  };

  /// Encode object as JSON string
  @override
  String toString() => jsonEncode(toJson());
}

class WalletTransactionData {
  final String id;
  final String userId;
  final String credit;
  final String debit;
  final String balance;
  final String transactionDate;
  final String description;

  WalletTransactionData({
    this.id = '',
    this.userId = '',
    this.credit = '',
    this.debit = '',
    this.balance = '',
    this.transactionDate = '',
    this.description = '',
  });

  /// Factory constructor for parsing from JSON
  factory WalletTransactionData.fromJson(Map<String, dynamic> json) {
    return WalletTransactionData(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      credit: json['credit'] ?? '',
      debit: json['debit'] ?? '',
      balance: json['balance'] ?? '',
      transactionDate: json['transaction_date'] ?? '',
      description: json['description'] ?? '',
    );
  }

  /// Convert object to JSON map
  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'credit': credit,
    'debit': debit,
    'balance': balance,
    'transaction_date': transactionDate,
    'description': description,
  };

  @override
  String toString() => jsonEncode(toJson());
}
