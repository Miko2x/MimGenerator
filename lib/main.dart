import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mim_generator/core/strings/words.dart';
import 'package:mim_generator/core/theme/palette.dart';
import 'package:mim_generator/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MimWords.mimGenerator,
      theme: ThemeData(
        fontFamily: 'Mulish',
        primaryColor: Palette.primary,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Palette.primary,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: Colors.white,
          elevation: 0.5,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.mimList,
      getPages: AppPages.pages,
    );
  }
}
