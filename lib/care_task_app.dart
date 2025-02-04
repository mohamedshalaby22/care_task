import 'package:care_task/core/routing/app_router.dart';
import 'package:care_task/core/theming/colors.dart';
import 'package:care_task/features/responsive/mobile_scaffold.dart';
import 'package:care_task/features/responsive/responsive_layout.dart';
import 'package:care_task/features/responsive/tablet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/responsive/desktop_scaffold.dart';

class CareTaskApp extends StatelessWidget {
  const CareTaskApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 656),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          scaffoldBackgroundColor: ColorsManager.mainPink
        ),
         onGenerateRoute: appRouter.generateRoutes,
        debugShowCheckedModeBanner: false,
        home: const ResponsiveLayout(
          mobileSacffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold(),
        ),
      ),
    );
  }
}
