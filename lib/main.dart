import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hey_miranda_repo/api/api_services.dart';
import 'package:hey_miranda_repo/api/parms.dart';
import 'package:hey_miranda_repo/home_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hey_miranda_repo/providers/user_management_providers.dart';
import 'package:hey_miranda_repo/utils/SharedPrefrence.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    callgetAuthTokenApi();
    super.initState();
  }
  callgetAuthTokenApi() async {
    await ApiServices.getId();
    var deviceId =
    await CustomPreferences.getPreferences(Params.device_uniqueid);
    await ApiServices.getAuthTokenApi();
    var authToken = await CustomPreferences.getPreferences(Params.auth_token);
    print('Device Id : $deviceId');
    print('Auth Token : $authToken');


    // await ApiServices.versionControlApi(navigatorKey);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: UserManagementProvider()),

    ],

       child:GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
        // new TextEditingController().clear();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Basic Sans SF Regular',
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    ));
  }
}

