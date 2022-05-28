import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trooth/providers/ServicesController.dart';
import 'package:trooth/views/ResultPage.dart';
import 'package:trooth/views/Search.dart';
import 'package:trooth/views/SplashScreen.dart';

void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,

  );
  ServicesController newsController = Get.put(ServicesController());
  SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  await newsController.getNews();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ResultPage(),
    );
  }
}

