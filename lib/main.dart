import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/banner_provider.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/providers/detail_product_provider.dart';
import 'package:tika_store/providers/home_provider.dart';
import 'package:tika_store/providers/navigate_provider.dart';

import 'routers/router.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigateProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Tika',
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
        theme: ThemeData(
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: AppColors.primary),
            color: AppColors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.blue, // Navigation bar
              statusBarColor: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
