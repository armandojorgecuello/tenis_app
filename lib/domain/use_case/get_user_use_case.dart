import 'package:app_tennis/domain/entities/user.dart';
import 'package:app_tennis/domain/repository/user_local_repository.dart';

class GetUserUseCase {
  final UserLocalRepository _userLocalRepository;

  GetUserUseCase({required UserLocalRepository userLocalRepository})
    : _userLocalRepository = userLocalRepository;

  Future<User?>  getUserProfile({
    required String userId
  }) async {
    return await _userLocalRepository.getUserProfile(userId);
  }
}
