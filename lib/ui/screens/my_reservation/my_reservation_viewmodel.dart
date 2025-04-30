import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/my_reservations_ui_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_reservation_viewmodel.g.dart';

@riverpod
class MyReservationViewmodel extends _$MyReservationViewmodel {
  @override
  MyReservationsUiEntity build() {
    return MyReservationsUiEntity.init();
  }

  Future<void> getMyReservtions() async {
    final response =
        await ref.read(getMyReservationsUsecaseProvider).getTennisCourts();
    state = state.copyWith(myReservations: response);
  }
}
