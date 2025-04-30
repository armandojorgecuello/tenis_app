import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';

abstract class TennisCourtsRepository {
  Future<int> insertTennisCourts({required List<TennisCourts> courts});
  Future<List<TennisCourts>> getTennisCourts();
  Future<int> insertReservation(TennisCourtsReservedModel reservation);
  Future<List<TennisCourtsReserved>> getReservations();
  Future<Map<String, dynamic>?> getReservationById(String id);
  Future<int> updateReservation(TennisCourtsReservedModel reservation);
}
