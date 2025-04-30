import 'package:app_tennis/domain/entities/tennis_courts_reservation.dart';

import 'exports.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page, initial: false),
    AutoRoute(page: RegisterRoute.page, initial: false),
    AutoRoute(page: DashboardRoute.page, initial: false),
    AutoRoute(page: NewReservationRoute.page, initial: false),
    AutoRoute(page: ReservationDetailsRoute.page, initial: false),
  ];
}
