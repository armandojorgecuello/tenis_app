import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/utils/extensions.dart';

class MyReservationsCard extends ConsumerWidget {
  const MyReservationsCard({super.key, required this.data});

  final TennisCourtsReserved data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return InkWell(
      onTap: () {
        router.push(ReservationDetailsRoute(tennisCourts: data));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              top: 16.h,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColor.grrayBorder, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image(
                        image: AssetImage(data.image),
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            SvgPicture.asset(MyAssets.images.calendar),
                            SizedBox(width: 6.w),
                            Text(
                              data.dateReserved!.toSpanishDate(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.textcolor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Reservado por: ${data.reserverdBy}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.labelColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.watch_later_outlined, size: 16.sp),
                            SizedBox(width: 4.w),
                            Text(
                              data.reservedHours!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.textcolor,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                              child: const VerticalDivider(),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              data.reservedHours!.calculatePrice(data.price ?? data.pricePerHour),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.textcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
