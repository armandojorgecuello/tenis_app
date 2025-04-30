import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/utils/extensions.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:app_tennis/ui/widgets/custom_carrousel_image.dart';
import 'package:app_tennis/ui/widgets/resumen_item.dart';

@RoutePage()
class ReservationDetailsPage extends StatelessWidget {
  const ReservationDetailsPage({super.key, required this.tennisCourts});
  final TennisCourtsReserved tennisCourts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imageList: [tennisCourts.image]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          tennisCourts.name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        '\$${tennisCourts.pricePerHour}',
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
                          tennisCourts.courtType,
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
                        tennisCourts.isAvailable
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
                        tennisCourts.availableHours,
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
                      Text(tennisCourts.location),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            PhysicalModel(
              color: AppColor.cardBackground,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resumen',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        ResumeItem(
                          titleOne: tennisCourts.courtType,
                          titleTwo: 'Instructor: ${tennisCourts.instructor}',
                          iconOne: MyAssets.images.tennis,
                          iconTwo: MyAssets.images.person,
                        ),
                        SizedBox(width: 10.w),
                        ResumeItem(
                          titleOne: tennisCourts.dateReserved!.toSpanishDate(),
                          titleTwo: tennisCourts.reservedHours ?? '',
                          iconOne: MyAssets.images.calendar,
                          iconTwo: MyAssets.images.watch,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total a pagar',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tennisCourts.reservedHours!.calculatePrice(
                          tennisCourts.pricePerHour,
                        ),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColor.linkColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        'Por ${tennisCourts.reservedHours}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.labelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: 250.w,
                child: CustomButtom(
                  onPressed: () {},
                  buttomLabel: 'Reprogramar reserva',
                  backgroundColor: AppColor.white,
                  labelColor: AppColor.linkColor,
                  bordercolor: AppColor.linkColor,
                  iconString: MyAssets.images.calendar,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButtom(
                onPressed: () {},
                buttomLabel: 'Pagar',
                backgroundColor: AppColor.greenButton,
                labelColor: AppColor.white,
                bordercolor: AppColor.greenButton,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButtom(
                onPressed: () {},
                buttomLabel: 'Cancelar',
                backgroundColor: AppColor.white,
                labelColor: AppColor.black,
                bordercolor: AppColor.grrayBorder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
