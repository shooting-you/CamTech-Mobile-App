import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_komsan/splash_screen.dart';
import 'app/controllers/hotel_fav_controller.dart';
import 'app/controllers/theme_controller.dart';
import 'app/screens/auth/login_screen.dart';
import 'app/screens/home/home_screen.dart';
import 'app/services/translation_service.dart';
import 'app/themes/theme_color.dart';
import 'app/translations/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(HotelFavController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final service = Get.put(TranslationService());
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Komsan App',
      debugShowCheckedModeBanner: false,
      locale: TranslationService().currentLanguage == 'km_KH'
          ? const Locale('km', 'KH')
          : const Locale('en', 'US'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslation(),
      routes: {
        '/': (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
