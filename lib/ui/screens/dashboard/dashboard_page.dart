import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/screens/home/home_screen.dart';
import 'package:app_tennis/ui/screens/my_reservation/reservation_screen.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_navigation_bar.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  final String userId;
  const DashboardPage({required this.userId, super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped({required int index}) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<Widget> _pages;

  @override
  void initState() {
    
    _pages = [
      HomePage(userId: widget.userId),
      ReservationsPage(backButtom: _onItemTapped,),
      const SizedBox(),
      const SizedBox(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColor.black.withOpacity(0.5), AppColor.greenAppbar],
            ),
          ),
        ),
        leadingWidth: 120.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: SvgPicture.asset(
            MyAssets.images.logoHeader,
            width: 30.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigator(
        items: const [
          {"icon": Icons.home_filled, "label": "Inicio"},
          {"icon": Icons.today_outlined, "label": "Reservas"},
          {"icon": Icons.favorite_border, "label": "Favoritos"},
        ],
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index: index),
      ),
    );
  }
}
