import 'package:flutter/material.dart';
import 'package:flutter_film/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( FlutterFilm(appRoute: AppRoute(),));
}

class FlutterFilm extends StatelessWidget {
  final AppRoute appRoute;

  const FlutterFilm({super.key,  required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );

  }
}



