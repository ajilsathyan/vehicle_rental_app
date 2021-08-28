import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_rental/vehicle_rental/models/vehicle_rental_all_list.dart';
class VehicleRentalAllListScreen extends StatefulWidget {


  @override
  _VehicleRentalAllListScreenState createState() => _VehicleRentalAllListScreenState();
}

class _VehicleRentalAllListScreenState extends State<VehicleRentalAllListScreen> {
  TextEditingController searchController = TextEditingController();
  List<VehicleRentalAllList> vehicleRentalAllList = [];
  List<VehicleRentalAllList> vehicleRentalListFiltered = [];
  List<VehicleRentalAllList> vehicleRentalListSuggestionList = [];
  bool isLoading =false;
  bool isSelected=false;
  String selectedRangeValues = "";
  final dio = new Dio();
  List<String>rangeList=[];
  ScrollController _scrollController = new ScrollController();
 int pageNo=1;
 bool isFiltersApplied=false;
 GoogleMapController? mapController;

  @override
  void initState() {
    _getProfileData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNo = pageNo + 1;
      }
    });
    setState(() {
      rangeList = [
        '10',
        '20',
        '30',
        '40',
        '50',
        '100',
        '150',
        '300',
        '500',
        '800',
        '1000',
        '2000',
        '3000',
      ];

      selectedRangeValues = rangeList.first;
    });

    super.initState();
  }
  _getProfileData() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String userId = prefs.getString(USER_ID);
      // setState(() {
      //   userProfileImage = prefs.getString(USER_PROFILE_IMAGE);
      //   print("profile:$userProfileImage");
      //   print("userId:$userId");
      // });
      if (mounted)
        setState(() {
          //_userName = userName.length == 0 ? "User Name" : userName;
          //_userProfession = userSkill.length == 0 ? "Designation" : userSkill;
          // _userID = userId;
          _getMoreData();
        });
      // print("userrrrr" + _userID);
      // print("userRegistredId" + userRegistredId);
    } catch (e) {}
  }

  void _getMoreData() async {

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      try {
        final response = await dio.get(
            "https://softawork2.xyz/fandlApi/product/get_vehicle_rental_all");
        print(response);
        VehicleRentalAllLists getAllVehicleRental =
        VehicleRentalAllLists.fromJson(jsonDecode(response.toString()));
        if (getAllVehicleRental.status == 200) {
          List<VehicleRentalAllList> tempList = [];
          for (int i = 0; i <
              getAllVehicleRental.vehicleRentalAllList!.length; i++) {
            tempList.add(getAllVehicleRental.vehicleRentalAllList![i]);
          }
          setState(() {

            isLoading = false;
            // showProgressIndicator(false);
            // isMedicalListLoading=false;
            vehicleRentalAllList.addAll(tempList);
            print("Length of Vehicle Rental list>>>>>>>>"+vehicleRentalAllList.length.toString());

          });
          setState(() {
            isLoading = false;
            // showProgressIndicator(false);
            // isMedicalListLoading=false;

          });
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 404) {
          print(e.message);
          // showProgressIndicator(false);
          // isMedicalListLoading=false;
        } else {
          print(e.message);
          // showProgressIndicator(false);
          // isMedicalListLoading=false;
        }
      }
    }
  }
  int selectedPos=0;

  Widget _buildList() {

    return ListView.builder(
      //+1 for progressbar
      itemCount:isFiltersApplied?(vehicleRentalListFiltered.length==0?vehicleRentalListFiltered.length
          :vehicleRentalListFiltered.length+1):vehicleRentalAllList.length + 1,
      itemBuilder: (BuildContext context, int i) {

        try {
          // if (medicalsAllList[i].doctorsIsVisit == "0") {
          //   doctorVisit = "No";
          // } else {
          //   doctorVisit = "Yes";
          // }
          // setState(() {
          // String images = vehicleRentalAllList[i].vehicleImages!;
          // callImages(images);
          // String address = medicalsAllList[i].medicalsAddress!;
          // addAddress(address);
          // });
        } catch (e) {}

        if (i == (isFiltersApplied?vehicleRentalListFiltered.length:vehicleRentalAllList.length)) {
          print(vehicleRentalAllList.length.toString() +
              "/" +
              i.toString() +
              "/" +
              9.toString());
          if (vehicleRentalAllList.length == 9) {
            return Container(
              height: 150,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  "No More Record",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                width: 200,
                height: 200,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        child: Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            );
          }
        } else {
          String images = i < vehicleRentalAllList.length
              ? vehicleRentalAllList[i].vehicleImages ?? ""
              : "";
          final split = images.split(',');
          print( vehicleRentalAllList.length);
         Color clipperColor=Color(0xFF5E7Aff);
         Color buttonColor=Color(0xFF2f55ff);
          // return CustomCard(i: i,medicalsAllList:isFiltersApplied?vehicleRentalListFiltered:medicalsAllList,split: split,);
       return Card(
         elevation: 15,
         child: Container(
           height: MediaQuery
               .of(context)
               .size
               .height*.78,
           child: Column(
             children: [
               if(selectedPos == 0)
                 Column(children: [
                   Stack(
                     children: [
                       Container(
                         height:MediaQuery.of(context).size.height*.5,
                       ),
                       ClipPath(
                         clipper:OvalBottomBorderClipper(),
                         child: Container(
                           height:MediaQuery.of(context).size.height*.3,
                           width:MediaQuery.of(context).size.width,
                           color: clipperColor,
                           child:Column(
                             children: [
                               SizedBox(height: 15,),
                               Text("Pick your favorite vehicle for rent",style: TextStyle(color: Colors.white,fontSize: 16,),)
                             ],
                           ),
                         ),
                       ),
                       Positioned(
                         bottom: 0,
                         left: 0,
                         right: 0,
                         child: Stack(
                           children: [
                             Container(
                               width:MediaQuery.of(context).size.width,
                               height: MediaQuery.of(context).size.height*.45,

                             ),
                             Positioned(
                               bottom: 0,
                               left: 40,
                               right: 40,
                               child: Card(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(25)
                                 ),
                                 child: Container(
                                   width: MediaQuery.of(context).size.width*.6 ,
                                   height:  MediaQuery.of(context).size.height*.35,

                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(25),

                                   ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Text(vehicleRentalAllList[i].vehicleCompanyName!

                                         ,style: TextStyle(
                                         color: clipperColor,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold,
                                       ),),
                                     SizedBox(height: 10,),
                                     SizedBox(
                                       width: 100,
                                       child: Row(
                                         children: [
                                           Icon(Icons.star,color: clipperColor,size: 18,),
                                           Icon(Icons.star,color: clipperColor,size: 18,),
                                           Icon(Icons.star,color: clipperColor,size: 18,),
                                           Icon(Icons.star,color: clipperColor,size: 18,),
                                           Icon(Icons.star_border_purple500_outlined,color: clipperColor,size: 18,),
                                         ],
                                       ),
                                     ),
                                       SizedBox(height: 10,),
                                       Text("₹ "+vehicleRentalAllList[i].vehiclePerCharge! +"/Hour" ,style: TextStyle(
                                         color: clipperColor,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold
                                       ),),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             children: [
                                               Icon(Icons.group_add_rounded,color: buttonColor,size: 25,),
                                               SizedBox(width: 10,),
                                               Text("Good seats" ,style: TextStyle(
                                                 color: clipperColor,
                                                 fontSize: 15,
                                               ),)
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               Icon(Icons.local_gas_station_outlined,color: buttonColor,size: 25,),
                                               SizedBox(width: 10,),
                                               Text("Good MPG" ,style: TextStyle(
                                                 color: clipperColor,
                                                 fontSize: 15,
                                               ),)
                                             ],
                                           ),
                                         ],
                                       ),
                                       SizedBox(height: 30,),
                                       SizedBox(width: 190,height: 50,
                                       child:  TextButton(

                                           style: TextButton.styleFrom(
                                               backgroundColor:buttonColor,
                                               shape:  RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.circular(25)
                                               )
                                           ),
                                           onPressed: (){},
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Icon(Icons.call,color: Colors.white,),
                                           SizedBox(width: 15,),
                                           Text("Book Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                                         ],
                                       ),),),
                                       SizedBox(height: 30,),


                                     ],
                                   ),
                                 ),
                               ),
                             ),
                             Positioned(
                               left: MediaQuery.of(context).size.width*.2,
                               top: 0,
                               right: MediaQuery.of(context).size.width*.2,
                                 child: Container(
                               width:MediaQuery.of(context).size.width*.55,
                               height:MediaQuery.of(context).size.height*.18 ,

                               child:split[0].length==0?Column(children: [
                               ],):Container(
                                 width:MediaQuery.of(context).size.width*.55,
                                 height:MediaQuery.of(context).size.height*.18 ,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     image: DecorationImage(
                                       image: NetworkImage("https://softawork2.xyz/fandlApi/uploads/bazar/"+split[0]),
                                       fit: BoxFit.cover,
                                     ),
                                   ),),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: Colors.white,
                                   width: 2.5,
                                 ),
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(25),
                               ),
                             ),
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 5,),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height*.16,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Column(
                           children: [
                             Container(
                               width:70,
                               child: Center(child: Text("Cars",style:TextStyle(color: buttonColor))),

                               height: 25,
                             ),
                             SizedBox(height: 10,),
                             Container(
                               width: 80,
                               height: 80,
                          child: Icon(CupertinoIcons.car_detailed,color: buttonColor,size: 35,),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(100),
                                 border: Border.all(
                                   color: buttonColor,
                                   width: 0.5
                                 )
                               ),
                             )
                           ],
                         ),
                         Column(
                           children: [
                             Container(
                               width:70,
                               child: Center(child: Text("Cycle",style:TextStyle(color:buttonColor))),
                               height: 25,
                             ),
                             SizedBox(height: 10,),
                             Container(
                               width: 80,
                               height: 80,
                               child: Center(child: FaIcon(FontAwesomeIcons.bicycle,color: buttonColor,size: 30,)),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(100),
                                   border: Border.all(
                                       color: buttonColor,
                                       width: 0.5
                                   )
                               ),
                             )
                           ],
                         ),
                         Column(
                           children: [
                             Container(
                               width:70,
                               child: Center(child: Text("Bikes",style:TextStyle(color:buttonColor))),

                               height: 25,
                             ),
                             SizedBox(height: 10,),
                             Container(
                               width: 80,
                               height: 80,
                               child: Center(child: FaIcon(FontAwesomeIcons.biking,color: buttonColor,size: 30,)),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(100),
                                   border: Border.all(
                                       color: buttonColor,
                                       width: 0.5
                                   )
                               ),
                             )
                           ],
                         ),
                         Column(
                           children: [
                             Container(
                               width:70,
                               child: Center(child: Text("Auto",style:TextStyle(color:buttonColor))),
                               height: 25,
                             ),
                             SizedBox(height: 10,),
                             Container(
                               width: 80,
                               height: 80,
                               child: Icon(CupertinoIcons.car,color: buttonColor,size: 35,),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(100),
                                   border: Border.all(
                                       color: buttonColor,
                                       width: 0.5
                                   )
                               ),
                             )
                           ],
                         ),
                       ],
                     ),
                   )


                 ],),
               if(selectedPos == 1)
                 Column(
                   children: [
                     ClipPath(
                       clipper: MovieTicketClipper(),
                       child: Container(
                         height: 80,
                         width: MediaQuery.of(context).size.width,
                         color: clipperColor,
                         child: Center(child: Text("Images",style: TextStyle(color: Colors.white),)),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 5),
                       child: Container(
                         height: MediaQuery
                             .of(context)
                             .size
                             .height*.55,
                         child: (split[0] != null &&
                            split[0].isNotEmpty &&
                           split[0].length > 0) &&split[0].isNotEmpty
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
                                       ? Image.network(
                                     "https://softawork2.xyz/fandlApi/uploads/bazar/" + split[index],
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

                   ],
                 ),
               if(selectedPos == 2)
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     ClipPath(
                       clipper: MovieTicketClipper(),
                       child: Container(
                         height: 80,
                         width: MediaQuery.of(context).size.width,
                         color: clipperColor,
                         child: Center(child: Text("About",style: TextStyle(color: Colors.white),)),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height*.55,
                         padding: EdgeInsets.all(10.0) ,
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: buttonColor,
                             width: 1
                           ),
                           borderRadius: BorderRadius.circular(3)
                         ),
                         child: Text(vehicleRentalAllList[i].vehicleDescription!),
                       ),
                     )

                   ],),
               if(selectedPos == 3)
                 Column(
                   children: [
                     ClipPath(
                       clipper: MovieTicketClipper(),
                       child: Container(
                         height: 80,
                         width: MediaQuery.of(context).size.width,
                         color: clipperColor,
                         child: Center(child: Text("Contact",style: TextStyle(color: Colors.white),)),
                       ),
                     ),
                     SizedBox(height: 5,),
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height*.55,
                       padding: EdgeInsets.all(5),
                       child:ListView(
                         children: [
                           Stack(
                             children: [
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 height: MediaQuery.of(context).size.height*.37,
                                 color: Colors.blue,
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
                               Positioned(
                                   bottom: 0,
                                   right: 0,
                                   left: 0,
                                   child: Container(
                                     color: Colors.black38,
                                     height: 40,
                                     padding: EdgeInsets.all(4),
                                     child: Text(vehicleRentalAllList[i].vehicleAddress!,style: TextStyle(color: Colors.white),),
                                   ))
                             ],
                           ),
                           SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Row(
                               children: [
                                 Container(
                                   height: 35,
                                   width: 35,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(50),
                                     border: Border.all(
                                       color: buttonColor,
                                       width: 1
                                     )
                                   ),
                                   child: Icon(Icons.email,color: buttonColor,size: 20,),
                                 ),
                                 SizedBox(width: 20,height:35,child: VerticalDivider(color: buttonColor,thickness: 1,),),
                                 Text(vehicleRentalAllList[i].vehicleEmail!,style: TextStyle(color:buttonColor),)

                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Row(
                               children: [
                                 Container(
                                   height: 35,
                                   width: 35,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(50),
                                       border: Border.all(
                                           color: buttonColor,
                                           width: 1
                                       )
                                   ),
                                   child: Icon(Icons.launch,color: buttonColor,size: 20,),
                                 ),
                                 SizedBox(width: 20,height:35,child: VerticalDivider(color: buttonColor,thickness: 1,),),
                                 Text(vehicleRentalAllList[i].vehicleWebsite!,style: TextStyle(color:buttonColor),)

                               ],
                             ),
                           ),

                         ],
                       ),
                     )

                 ],),
               Spacer(),
               Stack(
                 children: [
                   Container(
                     height:100,
                   ),
                   Container(
                     height: 80,
                     child:  FancyBottomNavigation(
                       circleColor: Colors.white,
                       activeIconColor:clipperColor,
                       initialSelection: 0,
                       barBackgroundColor:clipperColor,
                       textColor: Colors.white,
                       inactiveIconColor:Colors.white,
                       tabs: [
                         TabData(
                           iconData: Icons.info,title: "info",),
                         TabData(iconData: Icons.camera, title: "gallery"),
                         TabData(iconData: Icons.person, title: "about"),
                         TabData(
                             iconData: Icons.location_on_rounded,
                             title: "contact"),
                       ],
                       onTabChangedListener: (position) {

                         setState(() {
                           print(position);
                           selectedPos=position;
                         });
                       },
                     ),

                   ),
                   Positioned(
                       bottom: 0,
                       left:0,right:0,
                       child:Container(
                         color:clipperColor,
                         height: 23,
                       )
                   )
                 ],
               )
             ],
           ),
         ),
       );
        }
      },
      controller: _scrollController,
    );
  }
  Widget _searchedBuildList() {
    return ListView.builder(
      //+1 for progressbar
      physics: ClampingScrollPhysics(),
      controller: _scrollController,
      itemCount: vehicleRentalListSuggestionList.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        var item = vehicleRentalListSuggestionList[index];
        if (index == vehicleRentalAllList.length) {
          if (vehicleRentalListSuggestionList.length == 9) {
            return Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  "No more Data",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        } else {
          String images = index < vehicleRentalListSuggestionList.length
              ? vehicleRentalListSuggestionList[index].vehicleImages ?? ""
              : "";
          final split = images.split(',');
           return Container();

          // return CustomCard(i: index,medicalsAllList: vehicleRentalListSuggestionList,split: split,);
        }
      },
    );
  }
  onSearchTextChanged(String text) async {
    vehicleRentalListSuggestionList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    vehicleRentalAllList.forEach((doctorItem) {
      if ((doctorItem.vehicleCompanyName!.toLowerCase().contains(text)) ||
          (doctorItem.vehicleAddress!.toLowerCase().contains(text)) ||
          (doctorItem.vehiclePersonName!.toLowerCase().contains(text)))
        setState(() {
          vehicleRentalListSuggestionList.add(doctorItem);
          print(vehicleRentalListSuggestionList);
        });
    });
    setState(() {});
  }
  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
              controller: searchController,
              decoration: new InputDecoration(
                  hintText: 'Search Medicals', border: InputBorder.none),
              onChanged: onSearchTextChanged,
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel),
              onPressed: () {
                searchController.clear();
                onSearchTextChanged('');
              },
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Vehicle & Rental",style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 380,
                      margin: EdgeInsets.all(12),
                      child: _buildSearchBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                        });
                      },
                      child: Icon(Icons.access_time_filled_outlined),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: height,
                  child: (vehicleRentalListSuggestionList.length > 0 ||
                      searchController.text.isNotEmpty)
                      ? _searchedBuildList()
                      : _buildList(),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              right: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 170,
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    color: Colors.white),
                child: Stack(
                  fit: StackFit.expand, // StackFit.expand fixes the issue
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          ExpansionTile(
                            title: Text("Range"),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: rangeList.length,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      selectedRangeValues = rangeList[index];
                                      setState(() {});
                                    },
                                    child: Container(
                                      color: selectedRangeValues ==
                                          rangeList[index]
                                          ? Colors.green[100]
                                          : null,
                                      child: Row(
                                        children: <Widget>[
                                          Radio(
                                              value: rangeList[index],
                                              groupValue: selectedRangeValues,
                                              onChanged: (s) {
                                                selectedRangeValues =
                                                    s.toString() + " km";
                                                print(
                                                    "selected range : $selectedRangeValues");
                                                setState(() {});
                                              }),
                                          Text(rangeList[index])
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )

                            ],
                          ),

                          ExpansionTile(
                            title: Text('Others'),
                            children: [
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            child: Text("Filter"),
                            onPressed: () {
                              setState(() {
                                isFiltersApplied = true;
                              });

                              vehicleRentalListFiltered.clear();
                              vehicleRentalAllList.forEach((element) {
                                /// range
                                if (element.vehiclePerCharge != null) {
                                  String apirange = element.vehiclePerCharge!.replaceAll(" km", "").replaceAll(",", "");
                                  double data = double.parse(apirange);
                                  print("Distance>>>>>>>"+apirange);
                                  double dataSelected =
                                  double.parse(selectedRangeValues);
                                  int range1 = data.round();
                                  int range2 = dataSelected.round();
                                  if (range1 <= range2) {
                                    vehicleRentalListFiltered.add(element);
                                  }
                                }

                              });
                              vehicleRentalListFiltered.forEach((element) {
                                print(element.vehiclePerCharge);
                                // print(element.doctorSpecialistName);
                              });
                              setState(() {
                                isSelected = false;
                              });
                              // selectedDoctorSpecialist = "";
                              selectedRangeValues = "";
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 10,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = false;
                                });
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

        ],
      ),
      floatingActionButton: Container(
        height: 330,
        width:60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Container()));
              },
              heroTag: "btn1",
              backgroundColor:Color(0xFF5E7aff),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),

    );
  }
}
