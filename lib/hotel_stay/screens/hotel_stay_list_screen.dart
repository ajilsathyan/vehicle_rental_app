

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HotelStayAllListScreen extends StatefulWidget {

  @override
  _HotelStayAllListScreenState createState() => _HotelStayAllListScreenState();
}

class _HotelStayAllListScreenState extends State<HotelStayAllListScreen> {
  int selectedPos=0;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  Card(
      child: Container(
        width: w,
        height: h * .78,
        child: Column(
          children: [
            if(selectedPos==0)
              Stack(
                children: [
                   Container(
                     width: w,
                     height: h*.7,
                     color: Colors.orange,
                   )
                ],
              ),
            if(selectedPos==1)
              Column(children: [

              ],),
            if(selectedPos==2)
              Column(children: [

              ],),
            if(selectedPos==3)
              Column(children: [

              ],),
            Spacer(),
            Container(
              height: 58,
              child: BottomNavyBar(
                selectedIndex: selectedPos,
                backgroundColor: Colors.orange[600],
                showElevation: true, // use this to remove appBar's elevation
                onItemSelected: (index){ setState(() {
                  selectedPos=index;
                  print(selectedPos);
                });},
                items: [
                  BottomNavyBarItem(
                    icon: Icon(Icons.info,color: selectedPos==0?Colors.white:Colors.black,),
                    title: Text('info',style: TextStyle(color: Colors.white),),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.camera,color: selectedPos==1?Colors.white:Colors.black,),
                    title: Text('gallery',style: TextStyle(color: Colors.white)),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.person,color: selectedPos==2?Colors.white:Colors.black,),
                    title: Text('about',style: TextStyle(color: Colors.white)),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.location_on_rounded,color:selectedPos==3?Colors.white:Colors.black,),
                    title: Text('contact',style: TextStyle(color: Colors.white)),
                    activeColor: Colors.red,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
