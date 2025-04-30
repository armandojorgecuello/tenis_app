import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';

class InsertTennisCourtUsecase {
  final TennisCourtsRepository _tennisCourtsRepository;

  InsertTennisCourtUsecase({
    required TennisCourtsRepository tennisCourtsRepository,
  }) : _tennisCourtsRepository = tennisCourtsRepository;

  Future<int> insertTennisCourts({required List<TennisCourts> courts}) async {
    return await _tennisCourtsRepository.insertTennisCourts(courts: courts);
  }
}
