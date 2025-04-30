import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';

class TennisCourtsReservedModel {
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

  TennisCourtsReservedModel({
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

  factory TennisCourtsReservedModel.fromJson(Map<String, dynamic> json) {
    return TennisCourtsReservedModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      courtType: json['courtType'] as String,
      availableDate: json['availableDate'] as String,
      availableHours: json['availableHours'] as String,
      pricePerHour: json['pricePerHour'] as String,
      reserverdBy: json['reserverdBy'] as String,
      timeReserved: json['timeReserved'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      isAvailable: json['isAvailable'] == 1 ? true : false,
      instructor: json['instructor'] as String,
      dateReserved: json['dateReserved'] as String?,
      reservedHours: json['reservedHours'] as String?,
      inittialHour: json['inittialHour'] as String?,
      finalHour: json['finalHour'] as String?,
      price: json['price'] as String?,
      commit: json['comment'] as String?,
    );
  }

  TennisCourtsReserved toEntity() => TennisCourtsReserved(
    id: id,
    name: name,
    courtType: courtType,
    availableDate: availableDate,
    availableHours: availableHours,
    pricePerHour: pricePerHour,
    reserverdBy: reserverdBy,
    timeReserved: timeReserved,
    location: location,
    image: image,
    isAvailable: isAvailable,
    instructor: instructor,
    dateReserved: dateReserved,
    reservedHours: reservedHours,
    inittialHour: inittialHour,
    finalHour: finalHour,
    price: price,
    commit: commit,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'courtType': courtType,
      'availableDate': availableDate,
      'availableHours': availableHours,
      'pricePerHour': pricePerHour,
      'reserverdBy': reserverdBy,
      'timeReserved': timeReserved,
      'location': location,
      'image': image,
      'isAvailable': isAvailable ? 1 : 0,
      'instructor': instructor,
      'dateReserved': dateReserved,
      'reservedHours': reservedHours,
      'inittialHour': inittialHour,
      'finalHour': finalHour,
      'price': price,
      'comment': commit,
    };
  }
}
