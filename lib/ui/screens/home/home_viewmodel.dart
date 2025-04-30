
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/home_ui_entity.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  @override
  HomeUIEntity build() {
    return HomeUIEntity.init();
  }

  void getUser({required String userId}) {
    ref
        .read(getUserUseCaseProvider)
        .getUserProfile(userId: userId)
        .then((value) {
          state = state.copyWith(user: value);
        })
        .catchError((error) {
          state = state.copyWith(user: null);
        });
  }

  void getTennisCourts() async {
    ref
        .read(getTennisCourtUsecaseProvider)
        .getTennisCourts()
        .then((value) {
          state = state.copyWith(tennisCourts: value);
        })
        .catchError((error) {
          state = state.copyWith(tennisCourts: []);
        });
  }
}
