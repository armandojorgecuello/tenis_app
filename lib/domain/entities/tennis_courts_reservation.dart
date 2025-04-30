class TennisCourtsReserved {
  final String? id;
  final String name;
  final String courtType;
  final String availableDate;
  final String availableHours;
  final String pricePerHour;
  final String reserverdBy;
  final String timeReserved;
  final String location;
  final String image;
  final bool isAvailable;
  final String? dateReserved;
  final String? reservedHours;
  final String? inittialHour;
  final String? finalHour;
  final String? price;
  final String? instructor;
  final String? commit;

  TennisCourtsReserved({
    this.id,
    required this.name,
    required this.courtType,
    required this.availableDate,
    required this.availableHours,
    required this.pricePerHour,
    required this.reserverdBy,
    required this.timeReserved,
    required this.location,
    required this.image,
    required this.isAvailable,
    required this.instructor,
    this.dateReserved,
    this.reservedHours,
    this.inittialHour,
    this.finalHour,
    this.price,
    this.commit,
  });

}
