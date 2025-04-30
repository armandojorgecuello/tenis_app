import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/entities/weather_state.dart';
import 'package:app_tennis/ui/screens/dashboard/weather_view_model.dart';
import 'package:app_tennis/ui/screens/new_reservation/new_reservation_viewmodel.dart';
import 'package:app_tennis/ui/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/calendar_drop_down.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:app_tennis/ui/widgets/custom_carrousel_image.dart';
import 'package:app_tennis/ui/widgets/custom_drop_down.dart';
import 'package:app_tennis/ui/widgets/hour_drop_down.dart';

@RoutePage()
class NewReservationPage extends ConsumerStatefulWidget {
  const NewReservationPage({super.key, required this.tennisCourts});
  final TennisCourts tennisCourts;

  @override
  ConsumerState<NewReservationPage> createState() => _NewReservationPageState();
}

class _NewReservationPageState extends ConsumerState<NewReservationPage> {
  @override
  Widget build(BuildContext context) {
    final WeatherState weather = ref.watch(weatherViewmodelProvider);
    final viewmodel = ref.read(newReservationViewmodelProvider.notifier);
    final state = ref.watch(newReservationViewmodelProvider);
    final appRouter = ref.read(appRouterProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imageList: [widget.tennisCourts.image]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.tennisCourts.name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        '\$${widget.tennisCourts.pricePerHour}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColor.linkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.tennisCourts.courtType,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        'Por hora',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.labelColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SizedBox(width: 4.w),
                      Text(
                        widget.tennisCourts.isAvailable
                            ? 'Disponible'
                            : 'No disponible',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.textcolor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.watch_later_outlined, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        widget.tennisCourts.availableHours,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.textcolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(MyAssets.images.location),
                      SizedBox(width: 4.w),
                      Text(weather.weather?.location.name ?? ''),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: 180.w,
                child: CustomDropdown(
                  labelText: 'Agregar instructor',
                  items: const ['Jorge Cuello', 'Dairys rangel'],
                  onSelected: (date) {
                    viewmodel.setInstructor(date!);
                  },
                ),
              ),
            ),
            SizedBox(height: 30.h),
            PhysicalModel(
              color: AppColor.cardBackground,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Establecer fecha y hora',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CalendarDropdown(
                      hintText: 'Seleccionr Fecha',
                      onDateSelected: (date) {
                        viewmodel.setDate(date.toIso8601String());
                      },
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: HourDropdown(
                            label: 'Hora de inicio',
                            onHourSelected: (p0) {
                              viewmodel.setStartHour(p0);
                            },
                            hintText: 'Hora de Inicio',
                            initialHour: '7:00 AM',
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: HourDropdown(
                            label: 'Hora de fin',
                            onHourSelected: (p0) {
                              viewmodel.setEndHour(p0);
                            },
                            hintText: 'Hora de fin',
                            initialHour: '7:00 AM',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Agregar un comentario',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.grrayBorder),
                      ),
                      child: TextField(
                        maxLines: 8,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: viewmodel.setCommment,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 50.h,
                      child: CustomButtom(
                        buttomLabel: 'Reservar',
                        backgroundColor: AppColor.greenAppbar,
                        labelColor: AppColor.white,
                        onPressed: () {
                          viewmodel
                              .createNewReservation(
                                TennisCourtsReservedModel(
                                  name: widget.tennisCourts.name,
                                  courtType: widget.tennisCourts.courtType,
                                  availableDate:
                                      widget.tennisCourts.availableDate,
                                  availableHours:
                                      widget.tennisCourts.availableHours,
                                  pricePerHour:
                                      widget.tennisCourts.pricePerHour,
                                  reserverdBy: widget.tennisCourts.reserverdBy,
                                  timeReserved:
                                      widget.tennisCourts.timeReserved,
                                  location: widget.tennisCourts.location,
                                  image: widget.tennisCourts.image,
                                  isAvailable: widget.tennisCourts.isAvailable,
                                  instructor: state.instructor,
                                  inittialHour: state.startHour,
                                  finalHour: state.endHour,
                                  dateReserved: state.dateSelected,
                                  commit: state.commment,
                                  reservedHours: state.startHour!
                                      .timeDifferenceFormatted(state.endHour!),
                                ),
                              )
                              .then((value) {
                                if (mounted) {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder:
                                        (_, __, ___) => AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Se ha guardado tu reserva con exito',
                                              ),
                                              CustomButtom(
                                                buttomLabel: 'Aceptar',
                                                backgroundColor:
                                                    AppColor.greenButton,
                                                labelColor: AppColor.white,
                                                onPressed: () {
                                                  appRouter.pop();
                                                  appRouter.pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                  );
                                }
                              });
                        },
                      ),
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
