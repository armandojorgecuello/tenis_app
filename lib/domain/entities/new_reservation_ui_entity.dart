class NewReservationUiEntity {
  final String? id;
  final String? name;
  final String? description;
  final String? dateSelected;
  final String? startHour;
  final String? endHour;
  final String? status;
  final String? commment;
  final String? instructor;

  NewReservationUiEntity({
    this.id,
    this.name,
    this.description,
    this.status,
    this.dateSelected,
    this.startHour,
    this.endHour,
    this.commment,
    this.instructor
  });

  factory NewReservationUiEntity.init()=>
      NewReservationUiEntity(
        id: '',
        name: '',
        description: '',
        status: 'pending',
        dateSelected: '',
        startHour: '',
        endHour: '',
        commment: '',
        instructor: '',
      );


  NewReservationUiEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? status,
    String? dateSelected,
    String? startHour,
    String? endHour,
    String? commment,
    String? instructor,
  }) {
    return NewReservationUiEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      dateSelected: dateSelected ?? this.dateSelected,
      startHour: startHour ?? this.startHour,
      endHour: endHour ?? this.endHour,
      commment: commment ?? this.commment,
      instructor: instructor ?? this.instructor,
    );
  }
}
