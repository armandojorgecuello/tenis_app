import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';

class InsertReservationUserUseCase {
  final TennisCourtsRepository _tennisCourtsRepository;

  InsertReservationUserUseCase({
    required TennisCourtsRepository tennisCourtsRepository,
  }) : _tennisCourtsRepository = tennisCourtsRepository;

  Future<int> insertReservation({
    required TennisCourtsReservedModel tennisCourtsReserved,
  }) async {
    return await _tennisCourtsRepository.insertReservation(
      tennisCourtsReserved,
    );
  }
}
