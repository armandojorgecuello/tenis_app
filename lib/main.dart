import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_tennis/data/data_source/local/database_helper.dart';
import 'package:app_tennis/dependency_injector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:app_tennis/enviroment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  await initializeDateFormatting('es', null);
  await dotenv.load(fileName: Enviroment.fileName);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      enableScaleText: () => true,
      builder:
          (context, child) => MaterialApp.router(
            routerConfig: router.config(),
            title: 'Tenis App',
          ),
    );
  }
}
