class EventAmountModel {
  final String id;
  final String eventId;
  final String amount;
  final String remarks;
  final String createdAt;
  final String pType;

  EventAmountModel({
    required this.id,
    required this.eventId,
    required this.amount,
    required this.remarks,
    required this.createdAt,
    required this.pType,
  });

  factory EventAmountModel.fromJson(Map<String, dynamic> json) {
    return EventAmountModel(
      id: json['id'],
      eventId: json['event_id'],
      amount: json['amount'],
      remarks: json['remarks'],
      createdAt: json['created_at'],
      pType: json['p_type'],
    );
  }
}