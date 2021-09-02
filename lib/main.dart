import 'package:flutter/material.dart';
import 'package:vehicle_rental/hotel_stay/screens/hotel_stay_list_screen.dart';
import 'package:vehicle_rental/real_estate/screens/rent_screen.dart';
import 'package:vehicle_rental/school_college/screens/school_all_lists_screen.dart';
import 'package:vehicle_rental/tour_and_travel/screens/tour_travel_all_list_screen.dart';
import 'package:vehicle_rental/vehicle_rental/screens/vehicle_rental_all_list_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HotelStayAllListScreen(),
    );
  }
}


