import 'package:flutter/material.dart';
import 'package:practice/main_layout.dart';
import 'package:practice/screen/auth_page.dart';
import 'package:practice/screen/booking_page.dart';
import 'package:practice/screen/doctordetails.dart';
import 'package:practice/screen/success_booking.dart';
import 'package:practice/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey=GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor:Config.primaryColor,
          border: Config.outlineBorder,
          focusedBorder: Config.errorBorder,
          enabledBorder: Config.focusBorder,
          floatingLabelStyle:TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        unselectedItemColor: Colors.grey.shade700,
          elevation:10,
          type: BottomNavigationBarType.fixed,
        )
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>const AuthPage(),
        'main':(context)=> const MainLayout(),
        'doc_details':(context)=>const DoctorDetails(),
        'booking_page':(context)=>const BookingPage(),
        'success_booking':(context)=>SuccessBooking(),

      },
    );
  }
}
