import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; //this allows us to translate your app with .tr()
import 'package:shared_preferences/shared_preferences.dart';
import 'CheckStatus.dart' as c;
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter uses widgets and this line make sure that all the tool are ready before doing anything
  await EasyLocalization.ensureInitialized();//EasyLocalization is the transition plugin and this line loads all the files in assets/lang
  final prefs = await SharedPreferences.getInstance();
  String? langCode = prefs.getString('language_code');
  runApp(
    EasyLocalization(
      supportedLocales: [ //this is the list of languages that our app supports 
      Locale('en'), // English
      Locale('hi'), // Hindi
      Locale('te'), // Telugu
      Locale('mr'), // Marathi
      Locale('bn'), // Bengali
      Locale('ta'), // Tamil
      Locale('kn'), // Kannada
],
    path: 'assets/lang',//this tells where our translation files are located
      fallbackLocale: Locale('en'), //this is the default langauge if something goes wrong
      startLocale: langCode != null ? Locale(langCode) : null,
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: c.SchoolLogin() // your starting page
      //flutter revison,rag complete cheyali iroju and pg ki velaka konchem practise cheyali anta ah bagvantude chuskuntadu mana vanthu enti ante krushi cheyadam varike
    );
  }
}



