// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    required String userId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         DashboardRoute.name,
         args: DashboardRouteArgs(userId: userId, key: key),
         initialChildren: children,
       );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DashboardRouteArgs>();
      return DashboardPage(userId: args.userId, key: args.key);
    },
  );
}

class DashboardRouteArgs {
  const DashboardRouteArgs({required this.userId, this.key});

  final String userId;

  final Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [NewReservationPage]
class NewReservationRoute extends PageRouteInfo<NewReservationRouteArgs> {
  NewReservationRoute({
    Key? key,
    required TennisCourts tennisCourts,
    List<PageRouteInfo>? children,
  }) : super(
         NewReservationRoute.name,
         args: NewReservationRouteArgs(key: key, tennisCourts: tennisCourts),
         initialChildren: children,
       );

  static const String name = 'NewReservationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewReservationRouteArgs>();
      return NewReservationPage(key: args.key, tennisCourts: args.tennisCourts);
    },
  );
}

class NewReservationRouteArgs {
  const NewReservationRouteArgs({this.key, required this.tennisCourts});

  final Key? key;

  final TennisCourts tennisCourts;

  @override
  String toString() {
    return 'NewReservationRouteArgs{key: $key, tennisCourts: $tennisCourts}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterPage();
    },
  );
}

/// generated route for
/// [ReservationDetailsPage]
class ReservationDetailsRoute
    extends PageRouteInfo<ReservationDetailsRouteArgs> {
  ReservationDetailsRoute({
    Key? key,
    required TennisCourtsReserved tennisCourts,
    List<PageRouteInfo>? children,
  }) : super(
         ReservationDetailsRoute.name,
         args: ReservationDetailsRouteArgs(
           key: key,
           tennisCourts: tennisCourts,
         ),
         initialChildren: children,
       );

  static const String name = 'ReservationDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReservationDetailsRouteArgs>();
      return ReservationDetailsPage(
        key: args.key,
        tennisCourts: args.tennisCourts,
      );
    },
  );
}

class ReservationDetailsRouteArgs {
  const ReservationDetailsRouteArgs({this.key, required this.tennisCourts});

  final Key? key;

  final TennisCourtsReserved tennisCourts;

  @override
  String toString() {
    return 'ReservationDetailsRouteArgs{key: $key, tennisCourts: $tennisCourts}';
  }
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
