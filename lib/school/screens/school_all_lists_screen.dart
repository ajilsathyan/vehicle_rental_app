import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SchoolAllListsScreen extends StatefulWidget {
  @override
  _SchoolAllListsScreenState createState() => _SchoolAllListsScreenState();
}

class _SchoolAllListsScreenState extends State<SchoolAllListsScreen> {
  int isSelected=0;
  List<String>split=['https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2017/09/23/Pictures/_a6cc9944-a089-11e7-ba2d-20fa1b34073f.jpg',
    'https://greenmodelschool.com/wp-content/uploads/2021/01/gmhss-4.jpg',
    'https://www.ssshss.edu.in/images/infra_gallery/School.jpg',
    'https://greenmodelschool.com/wp-content/uploads/2021/01/gmhss-4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    GoogleMapController? mapController;
    return Scaffold(
      body: SafeArea(
        child: Card(
          child: Container(
            width: w,
            height: h * .78,
            child: Column(
              children: [
                if(isSelected==0)
                Stack(
                  children: [
                    Container(
                      width: w,
                      height: h * .715,
                    ),
                    Positioned(
                        top:0,
                        left: 30,
                        right: 30,
                        child: ClipPath(
                          clipper: ImgBackGroundClipper(),
                          child: Container(
                            width: w * .7,
                            height: w * .8,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xFFF57F17),
                                    Color(0xFFF9A825),
                                    Color(0xFFFBC02D),
                                    Color(0xFFFDD835),
                                    Color(0xFFFDD835),
                                    Color(0xFFFBC02D),
                                    Color(0xFFF9A825),
                                    Color(0xFFF57F17),
                                  ],
                                )
                            ),

                          ),
                        )),
                    Positioned(
                        top: 60,
                        right: w * .2,
                        left: w * .2,
                        child: Container(
                          width: w / 2,
                          height: w * .5,
                          decoration: BoxDecoration(
                            color: Colors.yellow[900],
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://ak.picdn.net/offset/photos/5e792760d164c0404ea4ac38/medium/offset_919314.jpg'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Color(0xFFFF6F00),
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                        )),
                    Positioned(
                       bottom: 200,
                        right:20,
                        left: 20,
                        child: Container(
                          width: w * .95,
                          height: h * .14,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("THE CREATIVE",style: TextStyle(fontSize: 20),),
                                  Text("EDUCATION",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.yellow[900]),),
                                  SizedBox(width: h*.08,child: Divider(color:Colors.black,thickness: 3,),),
                                  Container(
                                    height: 30,
                                    width: w*.38,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xFFF57F17),
                                            Color(0xFFF9A825),
                                            Color(0xFFFBC02D),
                                            Color(0xFFFDD835),
                                          ],
                                        )
                                    ),
                                    child: Center(child: Text("ADMISSION OPEN",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 4,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("ABOUT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                                      SizedBox(width: 8,),
                                      Text("US",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow[900])),
                                    ],
                                  ),
                                  Container(
                                    width: w*.4,
                                    child: Text("There are many variations of passages"
                                        " of Lorem Ipsum available, but the majority"
                                        " have suffered alteration in some form, by"
                                        " injected humour, or randomised words"
                                        " which don't look even slightly believable.",style: TextStyle(fontSize: 10,color: Colors.black),),
                                  )
                                ],
                              )

                            ],
                          ),
                        )),
                    Positioned(
                       left: 10,
                        right: 10,
                        bottom: 100,
                        child: Container(
                      width: w * .95,
                      height: h * .08,
                      child:Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("BEST QUALITY",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 6,),
                                  Text("EDUCATION",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                ],
                              ),
                              decoration:BoxDecoration(
                                border:Border.all(
                                  width: 2,
                                  color: Colors.black
                                )
                              ) ,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("CREATIVE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.yellow[900]),),
                                  SizedBox(height: 6,),
                                  Text("LEARNING",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.yellow[900])),
                                ],
                              ),
                              decoration:BoxDecoration(
                                  border:Border.all(
                                      width: 2,
                                      color: Colors.black
                                  )
                              ) ,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("DYNAMIC",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 6,),
                                  Text("TEAM WORK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                ],
                              ),
                              decoration:BoxDecoration(
                                  border:Border.all(
                                      width: 2,
                                      color: Colors.black
                                  )
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                        bottom: 0,
                        child: ClipPath(
                            clipper: BottomClipper(),
                            child: Container(
                              width: w,
                              height: h*.1,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFF57F17),
                                      Color(0xFFF9A825),
                                      Color(0xFFFBC02D),
                                      Color(0xFFFDD835),
                                    ],
                                  )
                              ),
                            ))),
                    Positioned(
                        bottom: 0,
                        right: 45,
                        left: 45,
                        child: ClipPath(
                          clipper: WEClipper(),
                          child: Container(height: h*.07,color: Colors.indigo[900],
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Text("Website: www.github.com",style: TextStyle(fontSize: 9,color: Colors.white,),),
                                SizedBox(
                                    height: 25,
                                    width: 20,
                                    child: VerticalDivider(color: Colors.white,thickness: 2,)),
                                Text("Email: info@youremail.com",style: TextStyle(fontSize: 9,color: Colors.white,)),
                                Spacer(),
                              ],
                            ),
                    ),
                        )),
                    Positioned(
                    top: 0,
                        right: 0,
                        child: ClipPath(
                          clipper: TopClipper(),
                          child: Container(
                      width: w*.25,
                      height: w*.25,
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.bottomCenter,
                         end: Alignment.topCenter,
                         colors: [
                           Color(0xFFF57F17),
                           Color(0xFFF9A825),
                           Color(0xFFFBC02D),
                           Color(0xFFFDD835),
                         ],
                       )
                   ),
                    ),
                        )),
                    Positioned(
                        top: w*.4,
                        left: 0,
                        child:ClipPath (
                          clipper: SideClipper(),
                          child: Container(width: w*.1,height: w*.2,decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xFFF57F17),
                              Color(0xFFF9A825),
                              Color(0xFFFBC02D),
                              Color(0xFFFDD835),
                            ],
                          )
                    ),),
                        )),


                  ],
                ),
                if(isSelected==1)
                  Column(children: [
                    Container(
                      height: h*.07,
                      width: w,
                      color:Color(0xFFFDD835),
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
                        child: (split[0] != null &&
                             split[0].isNotEmpty &&
                         split[0].length > 0) && split[0].isNotEmpty
                            ? StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount:split.length,
                          itemBuilder:
                              (BuildContext context, int index) =>
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child:split[index] != null
                                      ? Image.network(split[index],
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
                if(isSelected==2)
                  Column(children: [
                    Container(
                      height: h*.07,
                      width: w,
                      color:Color(0xFFFDD835),
                      child: Center(child: Text("About",
                        style: TextStyle(color: Colors.white,fontSize:15 ,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: w,
                        height: h*.55,
                        padding: EdgeInsets.all(10),
                        child: Text("There are many variations of passages"
                            " of Lorem Ipsum available, but the majority "
                            "have suffered alteration in some form,"
                            " by injected humour, or randomised words "
                            "which don't look even slightly believable."
                            " If you are going to use a passage of Lorem"
                            " Ipsum, you need to be sure there isn't anything "
                            "embarrassing hidden in the middle of text."
                            " All the Lorem Ipsum generators on the Internet"
                            " tend to repeat predefined chunks"
                            " as necessary, making this the"
                            " first true generator on the Internet"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(width: 1,color: Color(0xFFF9A825))
                        ),
                      ),
                    )
                  ],),
                if(isSelected==3)
                  Column(children: [
                    Container(
                      height: h*.07,
                      width: w,
                      color:Color(0xFFFDD835),
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
                    selectedIndex: isSelected,
                    backgroundColor: Color(0xFFFDD835),
                    showElevation: true, // use this to remove appBar's elevation
                    onItemSelected: (index) => setState(() {
                      isSelected=index;
                    }),
                    items: [
                      BottomNavyBarItem(
                        icon: Icon(Icons.info,color: isSelected==0?Colors.white:Colors.black,),
                        title: Text('info',style: TextStyle(color: Colors.white),),
                        activeColor: Colors.red,
                      ),
                      BottomNavyBarItem(
                          icon: Icon(Icons.camera,color: isSelected==1?Colors.white:Colors.black,),
                          title: Text('gallery',style: TextStyle(color: Colors.white)),
                        activeColor: Colors.red,
                      ),
                      BottomNavyBarItem(
                          icon: Icon(Icons.person,color: isSelected==2?Colors.white:Colors.black,),
                          title: Text('about',style: TextStyle(color: Colors.white)),
                        activeColor: Colors.red,
                      ),
                      BottomNavyBarItem(
                          icon: Icon(Icons.location_on_rounded,color:isSelected==3?Colors.white:Colors.black,),
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
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(30, 0);
    // path.lineTo(0,40);
    var cp1=Offset(5,-10);
    var ep1=Offset(0,10);
    path.quadraticBezierTo(cp1.dx, cp1.dy, ep1.dx, ep1.dy);


    var cp2=Offset(0,50);
    var ep2=Offset(size.width*.4,45);
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx,ep2.dy);

    var cp3=Offset(size.width-45,size.height*.2);
    var ep3=Offset(size.width*.6,size.height*.6);
    path.quadraticBezierTo(cp3.dx, cp3.dy, ep3.dx,ep3.dy);
    // path.lineTo(size.width*.6,size.height*.6);
    // path.lineTo(size.width*.8,size.height*.8);
    var cp4=Offset(size.width*.57, size.height);
    var ep4=Offset(size.width, size.height*.8);
    path.quadraticBezierTo(cp4.dx,cp4.dy, ep4.dx,ep4.dy);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
class WEClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.moveTo(size.width/20,0);
    var cp1=Offset(5,size.height/5 );
    var ep1=Offset(0, size.height);
    path.quadraticBezierTo(cp1.dx,cp1.dy, ep1.dx, ep1.dy);
    path.lineTo(size.width, size.height);
    var cp2=Offset(size.width-5,size.height/5 );
    var ep2=Offset(size.width-(size.width/20),0);
    path.quadraticBezierTo(cp2.dx,cp2.dy, ep2.dx, ep2.dy);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
  
}
class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(15, 0);
    var cp1=Offset(23,0);
    var ep1=Offset(30, 5);
    path.quadraticBezierTo(cp1.dx,cp1.dy, ep1.dx, ep1.dx);
    var cp2=Offset(35,size.height/1.9);
    var ep2=Offset(size.width/8,  size.height/2);
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx, ep2.dy);
    path.lineTo(size.width-size.width/8, size.height/2);
    var cp3=Offset(size.width-35, size.height/1.9);
    var ep3=Offset(size.width-30, 10);
    path.quadraticBezierTo(cp3.dx, cp3.dy, ep3.dx, ep3.dy);
    var cp4=Offset(size.width-30, 0);
    var ep4=Offset(size.width-10, 0);
    path.quadraticBezierTo(cp4.dx, cp4.dy, ep4.dx, ep4.dy);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}
class SideClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
   path.lineTo(0, 0);
   var cp1=Offset(size.width*.3, size.height*.7);
   var ep1=Offset(size.width*.7, size.height*.6);
   path.quadraticBezierTo(cp1.dx, cp1.dy,ep1.dx, ep1.dy);
    //
    var cp2=Offset(size.width, size.height*.5);
    var ep2=Offset(size.width*.7, size.height*.8);
    path.quadraticBezierTo(cp2.dx, cp2.dy,ep2.dx, ep2.dy);

   var cp3=Offset(size.width*.5,size.height);
   var ep3=Offset(0, size.height);
   path.quadraticBezierTo(cp3.dx, cp3.dy,ep3.dx,ep3.dy);
   path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}
class ImgBackGroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
   path.moveTo(size.width*.4, 40);
   path.lineTo(size.width*.2,size.height*.4);
    var cp2=Offset(-10,size.height*.55);
    var ep2=Offset(size.width*.2, size.height*.6);
    path.quadraticBezierTo(cp2.dx,cp2.dy, ep2.dx,ep2.dy);

   path.lineTo(size.width*.4, size.height*.75);
    var cp3=Offset(size.width*.75,size.height-20);
    var ep3=Offset(size.width*.5, size.height*.7);
    path.quadraticBezierTo(cp3.dx,cp3.dy, ep3.dx,ep3.dy);
   // path.lineTo(size.width*.6, size.height*.8);
   // path.lineTo(size.width*.6, size.height*.8);
   path.lineTo(size.width*.6, size.height*.6);
   var cp4=Offset(size.width,size.height*.5);
   var ep4=Offset(size.width*.9, size.height*.4);
   path.quadraticBezierTo(cp4.dx, cp4.dy, ep4.dx,ep4.dy);

    var cp1=Offset(size.width*.5,-20);
    var ep1=Offset(size.width*.4,40);
    path.quadraticBezierTo(cp1.dx,cp1.dy,ep1.dx, ep1.dy);
   path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}