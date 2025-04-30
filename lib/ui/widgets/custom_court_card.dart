import 'package:app_tennis/domain/entities/weather_state.dart';
import 'package:app_tennis/ui/screens/dashboard/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/data/models/tennis_courts_model.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/utils/extensions.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';

class CourtCard extends ConsumerWidget {
  const CourtCard({super.key, required this.court, });

  final TennisCourts court;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final WeatherState weather = ref.watch(weatherViewmodelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColor.grrayBorder, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                child: Image.asset(
                  court.image,
                  width: 250.w,
                  height: 137.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 230.w,
                      child: Row(
                        children: [
                          Text(
                            court.name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(MyAssets.images.weather),
                          SizedBox(width: 4.w),
                          Text(
                            '${weather.weather?.current.chanceOfRain}%',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.textcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      court.courtType,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.textcolor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SvgPicture.asset(MyAssets.images.calendar),
                        SizedBox(width: 4.w),
                        Text(
                          court.availableDate.toSpanishDate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textcolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SizedBox(width: 4.w),
                        Text(
                          court.isAvailable ? 'Disponible' : 'No disponible',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textcolor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.watch_later_outlined, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          court.availableHours,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textcolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: SizedBox(
                        width: 130.w,
                        child: CustomButtom(
                          buttomLabel: 'Reservar',
                          backgroundColor: AppColor.greenButton,
                          labelColor: AppColor.white,
                          onPressed: () {
                            router.push(
                              NewReservationRoute(tennisCourts: court),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
