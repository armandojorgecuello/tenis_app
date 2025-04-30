import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/domain/repository/tennis_courts_repository.dart';

class GetTennisCourtUsecase {
  final TennisCourtsRepository _tennisCourtsRepository;

  GetTennisCourtUsecase({
    required TennisCourtsRepository tennisCourtsRepository,
  }) : _tennisCourtsRepository = tennisCourtsRepository;

  Future<List<TennisCourts>> getTennisCourts() async {
    return await _tennisCourtsRepository.getTennisCourts();
  }
}
