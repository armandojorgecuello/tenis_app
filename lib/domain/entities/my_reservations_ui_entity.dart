import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';

class MyReservationsUiEntity {
  final List<TennisCourtsReserved> myReservations;
  

  MyReservationsUiEntity({
    required this.myReservations,
    
  });

  factory MyReservationsUiEntity.init()=>
      MyReservationsUiEntity(
        myReservations: [],
      );


  MyReservationsUiEntity copyWith({
    List<TennisCourtsReserved>? myReservations,
  }) {
    return MyReservationsUiEntity(
      myReservations: myReservations ?? this.myReservations,
    );
  }
}
