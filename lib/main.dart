import 'package:dreamwork/ui/BodyMeasure.dart';
import 'package:dreamwork/ui/CheckOut.dart';
import 'package:dreamwork/ui/DeleteAccount.dart';
import 'package:dreamwork/ui/ForgotPassword.dart';
import 'package:dreamwork/ui/HomePage.dart';
import 'package:dreamwork/ui/Login.dart';
import 'package:dreamwork/ui/Order.dart';
import 'package:dreamwork/ui/Payment.dart';
import 'package:dreamwork/ui/Register.dart';
import 'package:dreamwork/ui/ResetPassword.dart';
import 'package:dreamwork/ui/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'ui/Invoice.dart';
import 'ui/Reward.dart';
import 'ui/TopUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routes = {
    'homePage': (context) => HomePage(),
    'login' : (context) => Login(),
    'register': (context) => Register(),
    'bodyMeasure': (context) => BodyMeasure(),
    'forgotPassword': (context) => ForgotPassword(),
    'resetPassword': (context) => ResetPassword(),
    'deleteAccount': (context) => DeleteAccount(),
    'order' : (context) => Order(),
    'checkOut': (context) => CheckOut(),
    'payment' : (context) => Payment(),
    'topUp' : (context) => TopUp(),
    'invoice' : (context) => Invoice(),
    'reward' : (context) => Reward(),

  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    onGenerateRoute(RouteSettings settings) {
      final String name = settings.name!;
      print('Route name: $name');
      final Function pageContentBuilder = routes[name]!;
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
          settings: settings,
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: pageContentBuilder(context, arguments: settings.arguments),
          ),
        );
        return route;
      } else {
        final Route route = MaterialPageRoute(
          settings: settings,
          builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: pageContentBuilder(context)),
        );
        return route;
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      //The function in up there, use for push the name
      onGenerateRoute: onGenerateRoute,
    );
  }
}

