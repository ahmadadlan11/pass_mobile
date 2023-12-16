import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';

import 'package:pass/const/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  SharedPreferences sharedPreferences =Get.find();
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'Us')},
    {'name': 'العربية', 'locale': const Locale('ar', 'Ar')},
  ];
  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose a language'.tr),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          updateLanguage(locale[index]['locale']);

                          
                        },
                        child: SizedBox(width: double.maxFinite, child: Text(locale[index]['name'],style: languageColor,))),
                  );
                },
                itemCount: locale.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: AppColor.primary,
                  );
                },
              ),
            ),
          );
        });
  }
   updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
    ////print(locale);
    if (locale == const Locale('ar', 'Ar')) {
      Get.find<LanguageController>().languageIsArabic();
      Get.find<LanguageController>().setLanguage('ar');

      ////print('all good');
    } else {
      Get.find<LanguageController>().languageIsNotArabic();
      Get.find<LanguageController>().setLanguage('en');
    }
  }
  bool _isArabic = true;
  bool get isArabic => _isArabic;
  void languageIsArabic() {
    _isArabic = true;
    update();
  }

  void languageIsNotArabic() {
    _isArabic = false;
    update();
  }

  Future<void> setLanguage(String language) async {
    try {
      await sharedPreferences.setString(AppConstants.LANGUAGE, language);
    } catch (e) {
      rethrow;
    }
  }

  String getLanguage(){
     return sharedPreferences.getString(AppConstants.LANGUAGE)??'null';  
  }
}
