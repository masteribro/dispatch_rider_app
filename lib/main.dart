import 'package:dispatch_rider_app/ui/screens/map_folder/destination.dart';
import 'package:dispatch_rider_app/ui/screens/map_folder/map_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/intro_screen.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return  MaterialApp(
          navigatorKey: navigatorKey,
        title: 'Run Rider',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder:(context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting)
                {
                  return Center(child: CircularProgressIndicator(),);
                }
              else if(snapshot.data?.uid!=null){
                return MapScreen();
              }else{
                return IntroScreen();
              }
            } ),
      );
      },
    );
  }
}
