import 'package:app_tennis/data/data_source/local/database_helper.dart';
import 'package:app_tennis/domain/entities/user.dart';
import 'package:app_tennis/domain/repository/user_local_repository.dart';

class UserLocalRepositoryImpl implements UserLocalRepository {
  final DatabaseHelper _databaseHelper;

  UserLocalRepositoryImpl({required DatabaseHelper databaseHelper})
    : _databaseHelper = databaseHelper;

  @override
  Future<int> register(Map<String, dynamic> user) async {
    return await _databaseHelper.register(user);
  }

  @override
  Future<Map<String, dynamic>?> login(String email, String password) async {
    return await _databaseHelper.login(email, password);
  }

  @override
  Future<User?> getUserProfile(String userId) async {
    return await _databaseHelper.getUser(userId);
  }

  @override
  Future<int> deleteUser(int id) async {
    return await _databaseHelper.deleteUser(id);
  }

  @override
  Future<int> updateUser(Map<String, dynamic> user) async {
    return await _databaseHelper.updateUser(user);
  }
}
