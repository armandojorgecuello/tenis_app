import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/domain/entities/user.dart';

class HomeUIEntity {
  final List<TennisCourts> tennisCourts;
  final String userId;
  final User user;

  HomeUIEntity( {required this.userId,required this.tennisCourts, required this.user});

  factory HomeUIEntity.init() =>
      HomeUIEntity(tennisCourts: [], user: User.init(), userId: '');

  HomeUIEntity copyWith({List<TennisCourts>? tennisCourts, User? user, String? userId}) {
    return HomeUIEntity(
      tennisCourts: tennisCourts ?? this.tennisCourts,
      user: user ?? this.user,
      userId: userId ?? this.userId,
    );
  }
}
