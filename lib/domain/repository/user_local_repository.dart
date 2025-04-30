import 'package:app_tennis/domain/entities/user.dart';

abstract class UserLocalRepository {
  Future<int> register(Map<String, dynamic> user);
  Future<Map<String, dynamic>?> login(String email, String password);
  Future<User?> getUserProfile(String userId);
  Future<int> updateUser(Map<String, dynamic> user);
  Future<int> deleteUser(int id);
}