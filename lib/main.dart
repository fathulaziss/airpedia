import 'package:airpedia/app.dart';
import 'package:airpedia/app_config.dart';
import 'package:airpedia/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = isProduction
      ? Flavor.production
      : isStaging
          ? Flavor.staging
          : Flavor.development;
  await GetStorage.init();
  await initFirebase();
  await ApiService().init();

  start();
}

Future<void> initFirebase() async {
  // await Firebase.initializeApp();
  // await FirebaseService().initializeFirebaseMessaging();
  // await FirebaseService().initializeFirebaseMessagingHandler();
}
