import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/ui/screens/my_reservation/my_reservation_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_tennis/domain/entities/new_reservation_ui_entity.dart';

part 'new_reservation_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class NewReservationViewmodel extends _$NewReservationViewmodel {
  @override
  NewReservationUiEntity build() {
    return NewReservationUiEntity.init();
  }

  void setDate(String date) {
    state = state.copyWith(dateSelected: date);
  }

  void setStartHour(String time) {
    state = state.copyWith(startHour: time);
  }

  void setEndHour(String time) {
    state = state.copyWith(endHour: time);
  }

  void setCommment(String commment) {
    state = state.copyWith(commment: commment);
  }

  void setInstructor(String instructor) {
    state = state.copyWith(instructor: instructor);
  }

  Future<void> createNewReservation(
    TennisCourtsReservedModel tennisCourtsReserved,
  ) async {
    await ref
        .read(insertReservationUserUseCaseProvider)
        .insertReservation(tennisCourtsReserved: tennisCourtsReserved);
    await ref.read(myReservationViewmodelProvider.notifier).getMyReservtions();
  }
}
