import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pass/const/constants.dart';
import 'package:pass/const/locale_string.dart';
import 'package:pass/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/dependencies.dart' as dep;
import 'view/main scaffold/main_scaffold.dart';

late SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: Colors.grey.shade200,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale:prefs.getString(AppConstants.LANGUAGE) ==('en') ?const Locale('en', 'US'):const Locale('ar', 'Ar'),
      title: 'AutoMall Center',
      // theme: _buildTheme(Brightness.light),
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        // fontFamily: GoogleFonts.reem,
        textTheme: const 
        TextTheme(
          
          bodyText2: TextStyle(),
        ),
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: MainScaffold(),
      home: MainScaffold() ,
      getPages: Pages.routes,
    );
  }
}
ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness,primaryColor: Colors.amberAccent);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.reemKufiInkTextTheme(),
  );
}