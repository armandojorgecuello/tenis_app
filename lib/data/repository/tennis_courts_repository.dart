import 'package:app_tennis/data/data_source/local/database_helper.dart';
import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';

class TennisCourtsRepositoryImpl implements TennisCourtsRepository {
  final DatabaseHelper _databaseHelper;

  TennisCourtsRepositoryImpl({required DatabaseHelper databaseHelper})
    : _databaseHelper = databaseHelper;

  @override
  Future<List<TennisCourts>> getTennisCourts() async {
    try {
      final response = await _databaseHelper.getTennisCourts();
      return response.map((court) => court).toList();
    } catch (e) {
      throw Exception('Failed to load tennis courts: $e');
    }
  }

  @override
  Future<int> insertTennisCourts({required List<TennisCourts> courts}) {
    try {
      return _databaseHelper.insertTennisCourts(courts: courts);
    } catch (e) {
      throw Exception('Failed to insert tennis courts: $e');
    }
  }

  @override
  Future<int> insertReservation(TennisCourtsReservedModel reservation) {
    try {
      return _databaseHelper.insertReservation(reservation);
    } catch (e) {
      throw Exception('Failed to get tennis courts: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> getReservationById(String id) {
    try {
      return _databaseHelper.getReservationById(id);
    } catch (e) {
      throw Exception('Failed to get tennis courts: $e');
    }
  }

  @override
  Future<List<TennisCourtsReserved>> getReservations() async{
    try {
      final response = await _databaseHelper.getReservations();
      return response.map((e)=> e.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get tennis courts: $e');
    }
  }

  @override
  Future<int> updateReservation(TennisCourtsReservedModel reservation) {
    try {
      return _databaseHelper.updateReservation(reservation);
    } catch (e) {
      throw Exception('Failed to update tennis courts: $e');
    }
  }
}
