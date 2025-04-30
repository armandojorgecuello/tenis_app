import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';

class GetMyReservationsUsecase {
  final TennisCourtsRepository _tennisCourtsRepository;

  GetMyReservationsUsecase({
    required TennisCourtsRepository tennisCourtsRepository,
  }) : _tennisCourtsRepository = tennisCourtsRepository;

  Future<List<TennisCourtsReserved>> getTennisCourts() async {
    return await _tennisCourtsRepository.getReservations();
  }
}
