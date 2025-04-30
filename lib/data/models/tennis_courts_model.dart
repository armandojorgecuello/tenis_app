class TennisCourts {
  final String name;
  final String courtType;
  final String availableDate;
  final String availableHours;
  final String pricePerHour;
  final String id;
  final String reserverdBy;
  final String timeReserved;
  final String location;
  final String image;
  final bool isAvailable;
  TennisCourts({
    required this.id,
    required this.name,
    required this.courtType,
    required this.availableDate,
    required this.availableHours,
    required this.location,
    required this.pricePerHour,
    required this.reserverdBy,
    required this.timeReserved,
    required this.image,
    required this.isAvailable,
  });

  factory TennisCourts.fromJson(Map<String, dynamic> json) {
    return TennisCourts(
      id: json['id'].toString(),
      name: json['name'] as String,
      courtType: json['court_type'] as String,
      availableDate: json['available_date'] as String,
      availableHours: json['price_per_hour'] as String,
      pricePerHour: json['reserved_by'] as String,
      reserverdBy: json['time_reserved'] as String,
      timeReserved: json['location'] as String,
      location: json['image'] as String,
      image: json['available_hours'] as String,
      isAvailable: json['is_available'] == 1 ? true : false ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'court_type': courtType,
      'available_date': availableDate,
      'price_per_hour': availableHours,
      'reserved_by': pricePerHour,
      'time_reserved': reserverdBy,
      'location': timeReserved,
      'image': location,
      'available_hours': image,
      'is_available':  isAvailable ? 1 : 0, 
    };
  }
}
