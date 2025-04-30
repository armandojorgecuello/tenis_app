import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/ui/screens/home/home_viewmodel.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/utils/tennis_court.dart';
import 'package:app_tennis/ui/widgets/custom_court_card.dart';
import 'package:app_tennis/ui/widgets/reserved_card.dart';
import 'package:app_tennis/ui/widgets/title.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage( {required this.userId,super.key});
  final String userId;
  @override
  ConsumerState<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewmodelProvider.notifier).getTennisCourts();
      ref.read(homeViewmodelProvider.notifier).getUser(userId: widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewmodelProvider);
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Hola ${state.user.name}!',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Titles(title: 'Canchas'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(
                height: 330.h,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  itemCount: state.tennisCourts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final court = state.tennisCourts[index];
                    return CourtCard(court: court,);
                  },
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Titles(title: 'Reservas Programadas'),
            ),
            SizedBox(height: 16.h),
            ...tennisCourtsReserved.map((e) => ReserverdCard(data: e)),
            SizedBox(height: 20.h),
          ]),
        ),
      ],
    );
  }
}
