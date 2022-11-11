import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/banner_provider.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/screens/navigate/navigate.dart';

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
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Tika',
        theme: ThemeData(
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: AppColors.primary),
            color: AppColors.primary,
            foregroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.blue, // Navigation bar
              statusBarColor: AppColors.primary,
            ),
          ),
        ),
        home: const NavigateView(),
      ),
    );
  }
}