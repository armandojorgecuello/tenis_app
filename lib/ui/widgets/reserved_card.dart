import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/data/models/tennis_courts_reservation_model.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/utils/extensions.dart';

class ReserverdCard extends ConsumerWidget {
  const ReserverdCard({super.key, required this.data});

  final TennisCourtsReservedModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        child: PhysicalModel(
          color: AppColor.cardBackground,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              top: 16.h,
            ),
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
                      style: TextStyle(fontSize: 16.sp, color: AppColor.black),
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
                        SizedBox(height: 12.h, child: const VerticalDivider()),
                        SizedBox(width: 4.w),
                        Text(
                          data.reservedHours!.calculatePrice(data.price!),
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
    );
  }
}
