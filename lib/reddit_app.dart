import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_task/reals/ui/reals_page.dart';

class RedditApp extends StatelessWidget {
  const RedditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      rebuildFactor: RebuildFactors.always,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tour',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ),
          home: const RealsPage(),
        );
      },
    );
  }
}
