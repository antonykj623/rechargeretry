class EventModel {
  final String id;
  final String name;
  final String date;
  final String venue;
  final String place;

  EventModel({
    required this.id,
    required this.name,
    required this.date,
    required this.venue,
    required this.place,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['event_name'],
      date: json['event_date'],
      venue: json['venue'],
      place: json['place'],
    );
  }
}