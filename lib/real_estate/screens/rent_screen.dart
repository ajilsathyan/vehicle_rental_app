import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealEstateScreen extends StatefulWidget {

  @override
  _RealEstateScreenState createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {
  int selectedPos=0;
  List<String> urls=[
    'https://i.pinimg.com/originals/5e/8f/0b/5e8f0b24f19624754d2aa37968217d5d.jpg',
    'https://i.pinimg.com/originals/c7/13/f0/c713f070f12ff742b085b7b0229641e6.jpg',
    'https://civilengdis.com/wp-content/uploads/2021/05/0e83271be9480bc53601ceec07353ebe.jpg',
    'https://storiestrending.com/wp-content/uploads/2020/08/fascinating-burlingame-residence-by-toby-long-design-and-cipriani-studios-design.jpg',
    'https://netstorage-legit.akamaized.net/images/6f7162502ae3d913.jpg'

  ];
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Estate"),
      ),
      body: Card(
        child: Container(
          width: w,
          height: h * .78,
          child: Column(
            children: [
              if(selectedPos==0)
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: w,
                        height: 300,
                      ),
                      Positioned(
                          child: Container(
                        width: w,
                        height: 260,
                        child: Image.network(
                          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg',
                          fit: BoxFit.cover,
                        ),
                      )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Stack(
                            children: [
                              Container(
                                width: w,
                                height: 80,
                              ),
                              Positioned(
                                  left: w * .2,
                                  right: w * .2,
                                  bottom: 0,
                                  top: 0,
                                  child: Container(
                                    width: w * .6,
                                    height: 80,
                                    color: Colors.orange[600],
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "PROPERTY",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text("RENT",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                          Text(
                                            " “Search. See. Love.” ",
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                bottom: 35,
                                left: 0,
                                top: 35,
                                child: Container(
                                  width: w * .28,
                                  height: 10,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                right: 0,
                                top: 35,
                                child: Container(
                                  width: w * .28,
                                  height: 10,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:15),
                      Icon(Icons.location_on_rounded,color: Colors.deepOrange,size: 18,),
                      SizedBox(width: 5,),
                      Text("200 km", style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      SizedBox(
                        width: 100,
                        child: Row(children: [
                          Icon(Icons.star,color: Colors.deepOrange,size: 18,),
                          Icon(Icons.star,color: Colors.deepOrange,size: 18,),
                          Icon(Icons.star,color: Colors.deepOrange,size: 18,),
                          Icon(Icons.star,color: Colors.deepOrange,size: 18,),
                          Icon(Icons.star,color: Colors.deepOrange,size: 18,),
                        ],),
                      ),
                      SizedBox(width: 5,)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Amenities",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[700]),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Provided",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],),
                  SizedBox(
                      width: w*.4,
                      child: Divider(color: Colors.black,thickness: 1.5,)),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bed,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "BedRoom",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.play,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8,),
                                      Text("1", style: TextStyle(
                                          fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Play Room",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bath,
                                        size: 20,
                                        color: Colors.indigo,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Bathroom",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.restroom,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Living Room",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.swimmingPool,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Pool",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.umbrellaBeach,
                                        color: Colors.indigo,size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Ocean View",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.tree,size: 20,
                                        color: Colors.indigo,
                                      ),
                                      SizedBox(width: 8,),
                                      Text("1", style: TextStyle(
                                          fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Garden",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.restroom,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Living Hall",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.cookieBite,
                                        color: Colors.indigo,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Kitchen",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.car,size: 20,
                                        color: Colors.indigo,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Garage",
                                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                                  )
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange[600]!.withOpacity(0.05)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 40,
                    width: w*.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.orange
                      ),
                        onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("24/7",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                            Icon(Icons.call,color: Colors.white,),
                            Text("BOOK NOW"),
                          ],
                        )),
                  )

                ],
              ),
              if(selectedPos==1)
                Column(children: [
                  Container(
                    height: h*.07,
                    width: w,
                    color:Colors.orange[600],
                    child: Center(child: Text("Gallery",
                      style: TextStyle(color: Colors.white,fontSize:15 ,fontWeight: FontWeight.bold),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height*.63,
                      child: (urls[0] != null &&
                          urls[0].isNotEmpty &&
                          urls[0].length > 0) && urls[0].isNotEmpty
                          ? StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount:urls.length,
                        itemBuilder:
                            (BuildContext context, int index) =>
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                ),
                                child:urls[index] != null
                                    ? Image.network(urls[index],
                                  fit: BoxFit.cover,
                                  height: 150,
                                  // width: 150,
                                )
                                    : SizedBox()),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(
                                2, index.isEven ? 2 : 1),
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                      )
                          : Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.photo_library,
                              color: Colors.grey[300],
                              size: 180,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No images added yet",
                              style: TextStyle(
                                color: Colors.grey[350],
                                fontSize: 22,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],),
              if(selectedPos==2)
                Column(children: [
                  Container(
                    height: h*.07,
                    width: w,
                    color:Colors.orange[600],
                    child: Center(child: Text("About",
                      style: TextStyle(color: Colors.white,fontSize:15 ,fontWeight: FontWeight.bold),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: w,
                      height: h*.55,
                      padding: EdgeInsets.all(10),
                      child: Text("Lorem Ipsum is simply dummy"
                          " text of the printing and typesetting "
                          "industry. Lorem Ipsum has been the"
                          " industry's standard dummy text ever "
                          "since the 1500s, when an unknown printer"
                          " took a galley of type and scrambled it"
                          " to make a type specimen book. It has"
                          " survived not only five centuries, but"
                          " also the leap into electronic typesetting,"
                          " remaining essentially unchanged. "
                          "It was popularised in the 1960s with the "
                          "release of Letraset sheets containing "
                          "Lorem Ipsum passages, and more recently "
                          "with desktop publishing software like"
                          " Aldus PageMaker including"
                          " versions of Lorem Ipsum."),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 1,color: Color(0xFFF9A825))
                      ),
                    ),
                  )
                ],),
              if(selectedPos==3)
                Column(children: [
                  Container(
                    height: h*.07,
                    width: w,
                    color:Colors.orange[600],
                    child: Center(child: Text("Contact",
                      style: TextStyle(color: Colors.white,fontSize:15 ,fontWeight: FontWeight.bold),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*.645,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(12.9716, 77.5946),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (controller){
                        mapController=controller;
                      },
                    ),
                  ),
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
      ),
    );
  }
}
