import 'package:app_tennis/ui/screens/dashboard/weather_view_model.dart';
import 'package:app_tennis/ui/screens/welcome/welcome_viewmodel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:app_tennis/domain/routes/app_router.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/utils/colors.dart';
import 'package:app_tennis/ui/widgets/custom_buttom.dart';

@RoutePage()
class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(welcomeViewmodelProvider.notifier).build();
      ref.read(weatherViewmodelProvider.notifier).getWeather();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MyAssets.images.background.image(
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  SvgPicture.asset(MyAssets.images.logo, fit: BoxFit.cover),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    height: 53.h,
                    width: double.infinity,

                    child: CustomButtom(
                      buttomLabel: 'Login',
                      onPressed: () {
                        appRouter.push(const LoginRoute());
                      },
                      backgroundColor: AppColor.greenButton,
                      labelColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 53.h,
                    width: double.infinity,

                    child: CustomButtom(
                      buttomLabel: 'Registrarme',
                      onPressed: () {
                        appRouter.push(const RegisterRoute());
                      },
                      backgroundColor: AppColor.white.withOpacity(.2),
                      labelColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
