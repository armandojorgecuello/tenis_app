import 'package:app_tennis/ui/screens/my_reservation/my_reservation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';
import 'package:app_tennis/ui/widgets/my_reservations_card.dart';
import 'package:app_tennis/ui/widgets/title.dart';

class ReservationsPage extends ConsumerStatefulWidget {
  const ReservationsPage({super.key, required this.backButtom, });
  final Function({required int index}) backButtom;

  @override
  ConsumerState<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends ConsumerState<ReservationsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (value) =>
          ref.read(myReservationViewmodelProvider.notifier).getMyReservtions(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myReservationViewmodelProvider);
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtom(
                  icon: Icons.calendar_today_outlined,
                  buttomLabel: 'Programar reserva',
                  backgroundColor: AppColor.greenButton,
                  labelColor: AppColor.white,
                  onPressed: () {
                    widget.backButtom(index:0);
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Titles(title: 'Mis Reservas'),
            ),
            SizedBox(height: 16.h),
            ...state.myReservations.map((e) => MyReservationsCard(data: e)),
          ]),
        ),
      ],
    );
  }
}
