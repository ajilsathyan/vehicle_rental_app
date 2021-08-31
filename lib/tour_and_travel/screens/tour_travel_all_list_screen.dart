import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_rental/tour_and_travel/models/tour_travel_all_lists_details.dart';

class TourAndTravelAllListScreen extends StatefulWidget {

  @override
  _TourAndTravelAllListScreenState createState() => _TourAndTravelAllListScreenState();
}

class _TourAndTravelAllListScreenState extends State<TourAndTravelAllListScreen> {
  TextEditingController searchController = TextEditingController();
  var dio=Dio();
  int selectedPos=0;
  List<TourTravelAllList> tourTravelAllList=[];
  List<TourTravelAllList> suggestionLists=[];
  List<TourTravelAllList> searchList=[];
  List<TourTravelAllList> filteredLists=[];
  GoogleMapController? mapController;
  List<String>rangeList=[];
  ScrollController _scrollController = new ScrollController();
  int pageNo=1;
  bool isFiltersApplied=false;
  String selectedRangeValues = "";
  bool isLoading =false;
  bool isSelected=false;
  int totalCount = 1;


  @override
  void initState() {
    _getProfileData();
    super.initState();
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
          getTourAndTravelLists();
        });
      // print("userrrrr" + _userID);
      // print("userRegistredId" + userRegistredId);
    } catch (e) {}
  }
  getTourAndTravelLists()async{
    try {
      final response = await dio.get(
          "https://softawork2.xyz/fandlApi/tour_travel/get_tour_travel_all?distance_range=10000&user_id=81&page_no=1");
      TourTravelAllListsDetails data =
      TourTravelAllListsDetails.fromJson(jsonDecode(response.toString()));
      if (response.statusCode == 200) {
        List<TourTravelAllList> tempList = [];
        for (int i = 0; i <
            data.tourTravelAllList!.length; i++) {
          tempList.add(data.tourTravelAllList![i]);
        }
        setState(() {
          tourTravelAllList.addAll(tempList);
          print(tourTravelAllList.length);
            totalCount = data.pagination!.totalRows!;
            isLoading = false;

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


  Widget _buildList() {

    return ListView.builder(
      //+1 for progressbar
      itemCount:isFiltersApplied?(filteredLists.length==0?filteredLists.length+1
          :filteredLists.length+1):tourTravelAllList.length + 1,
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

        if (i == (isFiltersApplied?filteredLists.length:tourTravelAllList.length)) {
          print(tourTravelAllList.length.toString() +
              "/" +
              i.toString() +
              "/" +
              9.toString());
          if (tourTravelAllList.length == totalCount) {
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
          String images = i < tourTravelAllList.length
              ? tourTravelAllList[i].tourTravelImages ?? ""
              : "";
          final split = images.split(',');
          print( tourTravelAllList.length);

          return CustomCard(i: i,tourTravelAllList:isFiltersApplied?filteredLists:tourTravelAllList,split: split,);

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
      itemCount: suggestionLists.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        var item = suggestionLists[index];
        if (index == tourTravelAllList.length) {
          if (suggestionLists.length == totalCount) {
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
          String images = index < tourTravelAllList.length
              ? tourTravelAllList[index].tourTravelImages ?? ""
              : "";
          final split = images.split(',');
          return CustomCard(i: index,tourTravelAllList:isFiltersApplied?filteredLists:tourTravelAllList,split: split,);
        }
      },
    );
  }
  onSearchTextChanged(String text) async {
    suggestionLists.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    tourTravelAllList.forEach((doctorItem) {
      if ((doctorItem.tourTravelName!.toLowerCase().contains(text)) ||
          (doctorItem.tourTravelAddress!.toLowerCase().contains(text)) ||
          (doctorItem.tourTravelEmail!.toLowerCase().contains(text)))
        setState(() {
          searchList.add(doctorItem);
          print(searchList);
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
                  hintText: 'Search tour and travels', border: InputBorder.none),
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
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return  Scaffold(
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
        title: Text("Tour & Travels",style: TextStyle(color: Colors.black),),
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
                  height: h,
                  child: (suggestionLists.length > 0 ||
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
                            title: Text("Kilometer"),
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
                              filteredLists.clear();
                              tourTravelAllList.forEach((element) {
                                /// range
                                if (element.distance != null) {
                                  String priceRate = element.distance!.replaceAll(" Km", "").replaceAll(",", "");
                                  double data = double.parse(priceRate);
                                  double dataSelected =
                                  double.parse(selectedRangeValues);
                                  int range1 = data.round();
                                  int range2 = dataSelected.round();
                                  if (range1 <= range2) {
                                    filteredLists.add(element);
                                  }
                                }

                              });
                              filteredLists.forEach((element) {
                                print(element.distance!);
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
        height: 200,
        width:60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              onPressed: () async {
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => Container()));
              },
              heroTag: "btn1",
              backgroundColor:Color(0xFFFF6F00),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),

    );
  }
}

class CustomCard extends StatefulWidget {
 final int i;
 final  List<TourTravelAllList> tourTravelAllList;
 final split;
 CustomCard({required this.i,required this.tourTravelAllList,this.split});
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int isSelectedPos=0;
  GoogleMapController? mapController;


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    double rating=0;
     createRating(String travel_id) async {
      // setState(() {
      //   loadingMessage = 'Adding...';
      //   submitting = true;
      // });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String userId = prefs.getString(USER_ID);
      // print("userid: $userId");
      Future.delayed(Duration(milliseconds: 1000), () async {
        Response response;
        var dio = Dio();
        dio.options.connectTimeout = 60 * 1000;
        print("<<<<<Travel id>>>>>>"+ "$travel_id");
        var formData = FormData.fromMap({
          'tour_travel_rating_visiting_id': '81',
          'tour_travel_id':"$travel_id",
          'tour_travel_rating':"$rating",
        });

        response = await dio.post(
          'https://softawork2.xyz/fandlApi/tour_travel/add_rating',
          data: formData,
          onSendProgress: (int sent, int total) {
            print('$sent $total');
          },
        ).catchError((e) {
          print(e.response.toString());
        });

        if (response.statusCode == 200) {
          var responseBody = response.data;
          print(responseBody);
          String ratingValue = responseBody['tour_travel_rating'];
          for (int i = 0; i <widget.tourTravelAllList.length; i++) {
            if (widget.tourTravelAllList[widget.i].tourTravelUserId == travel_id) {
              setState(() {
                widget.tourTravelAllList[widget.i].rating = ratingValue;
              });

            }
          }
          // Toast.show("Rating Added", context,
          //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          // setState(() {
          //   submitting = false;
          // });
        } else {
          // setState(() {
          //   submitting = false;
          // });
          // Toast.show("Rating Not Added", context,
          //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        }
      });
    }
    showRating({context, required String rate,required String id}){
      showDialog(context: context, builder: (context){
        return Dialog(
          child: Container(
            height: 220,
            width: 200,
            child: Column(
              children: [
                Container(
                  height:50,
                  width: 250,
                  padding: EdgeInsets.only(top: 15),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text("Rate here",style:TextStyle(color:Colors.yellow[900],fontSize: 20)),
                      Spacer(),
                      IconButton(
                          icon:Icon(Icons.close,color:Colors.black),
                          onPressed:(){
                            Navigator.pop(context);
                          }
                      )
                    ],
                  ),

                ),
                SizedBox(
              height: 120,
              child: Center(
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    setState(() {
                      rating=rating;
                    });
                  },
                ),
              ),
            ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: (){
                      Navigator.pop(context);
                    },child: Text("Cancel"),)),
                    SizedBox(width: 5,),
                    Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: (){
                      createRating(id);
                      Navigator.pop(context);
                    },child: Text("Submit"),)),
                    SizedBox(width: 5,),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    }

    showSchedules({context, required TourTravelAllList tourAndTravelAllList}){
      showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height:450,
            width:MediaQuery.of(context).size.width*.85,
            child: Column(
                children:[
                 Container(height: 50,
                   padding: EdgeInsets.all(10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment:CrossAxisAlignment.start,
                   children: [
                     SizedBox(width: 10,),
                     Text("Our schedules",style:TextStyle(color:Colors.yellow[900],fontSize: 20)),
                     Spacer(),
                     IconButton(
                         icon:Icon(Icons.close,color:Colors.black),
                         onPressed:(){
                           Navigator.pop(context);
                         }
                     )
                   ],
                 ),),
                  Container(
                    height:350,
                    child: ListView(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:10,top: 5),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("Day open and close time",
                                      style:TextStyle(color:Colors.black,fontSize:16,fontWeight:FontWeight.bold)),

                                ]
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left:10,right:10),
                              child:Divider(
                                color: Colors.yellow[900],
                                thickness:1.3,

                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                                height:300,
                                child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:[
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Monday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleMonOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleMonClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Tuesday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleTueOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleTueClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Wednesday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleWedClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleWedOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Thursday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleThuOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleThuClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Friday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleFriOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleFriClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Saturday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleSatOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleSatClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                      Row(
                                          children:[
                                            SizedBox(
                                                width:110,
                                                child: Text("Sunday" , style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.bold))),
                                            FaIcon(FontAwesomeIcons.clock,size:15,color:Colors.yellow[900]),
                                            SizedBox(width:5),
                                            SizedBox(
                                                width:185,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleSunOpening!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                    SizedBox(width:5),
                                                    Text(":"),
                                                    SizedBox(width:5),
                                                    SizedBox(
                                                      width:85,
                                                      child: Text(tourAndTravelAllList.tourTravelScheduleDetails!.scheduleSunClosing!,
                                                          style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold)),
                                                    ),
                                                  ],
                                                )),
                                          ]
                                      ),
                                    ]
                                )
                            ),
                          ),

                        ]
                    ),
                  ),


                ]
            ),
          ),
        );
      });
    }


    return Card(
      child: Container(
        width: w,
        height: h*.78,
        child: Column(
          children: [
            if(isSelectedPos==0)
            Stack(
                        children: [
                          Container(
                            width:w ,
                            height: h*.66,
                          ),
                          ClipPath(
                            clipper: ContainerClipperTwo(),
                            child: Container(
                              width: w,
                              height: h*.3,
                              color: Colors.yellow[800],
                            ),
                          ),
                          ClipPath(
                            clipper: ContainerClipperThree(),
                            child: Container(
                              width: w,
                              height: h*.3,
                              color: Colors.yellow[900],
                            ),
                          ),
                          ClipPath(
                            clipper: ContainerClipperOne(),
                            child: Stack(
                              children: [
                                Container(
                                  width: w,
                                  height: h*.3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image:NetworkImage("https://www.stoodnt.com/blog/wp-content/uploads/2020/06/travel-photographer-careers.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                Positioned(
                                  bottom: 130,
                                  left: 40,
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    color: Colors.black12,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("TIME TO",style: TextStyle(fontSize: 22,color: Colors.white)),
                                          Text("TRAVEL !!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /// Amazing
                          Positioned(
                            left: 10,
                            bottom: h*.13,
                            child:  Stack(
                              children: [
                                Container(
                                  height: h*.25,
                                  width: w*.45,
                                ),
                                ClipPath(
                                  clipper: ClipperAmazing(),
                                  child: Container(
                                    height: h*.25,
                                    width: w*.45,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFBC02D),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 2,right: 2,top: 2,
                                  bottom: 2,
                                  child: ClipPath(
                                    clipper: ClipperAmazing(),
                                    child: Container(
                                      height: h*.25,
                                      width: w*.45,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 40,top: 45,right:20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Amazing",style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,),),
                                                Text("Tour",style: TextStyle(fontSize:16,)),
                                              ],
                                            ),
                                            Container(
                                                width: 150,
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text("Amazing Tours Bangladesh is a Best Tour "
                                                    "Operator in Bangladesh We are doing Out"
                                                    ,style: TextStyle(fontSize: 13,color: Colors.grey[600])))

                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 125,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Icon(Icons.star,color: Colors.white,size: 30,),
                                      ),
                                      decoration:BoxDecoration(
                                        color: Colors.yellow[900],
                                        borderRadius: BorderRadius.circular(50),
                                      ) ,
                                    )),
                                Positioned(
                                    left: 0,
                                    top: -5,
                                    child: Text("1",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 180,
                                        color: Colors.red.withOpacity(0.1)),))
                              ],
                            ),
                          ),
                          /// Flight
                          Positioned(
                            right: 0,
                            bottom: h*.14,
                            child: Stack(
                              children: [
                                Container(
                                  height: h*.25,
                                  width: w*.48,
                                ),
                                ClipPath(
                                  clipper: ClipperFlight(),
                                  child: Container(
                                    height: h*.25,
                                    width: w*.48,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFBC02D),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 2,right: 2,top: 2,
                                  bottom: 2,
                                  child: ClipPath(
                                    clipper: ClipperFlight(),
                                    child: Container(
                                      height: h*.25,
                                      width: w*.48,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 35,top: 70,right:45),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Flight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                                                SizedBox(width: 5,),
                                                Text("Booking",style: TextStyle(fontSize: 16,)),
                                              ],
                                            ),
                                            Container(
                                                width: 120,
                                                child: Text("DISCOVER AMAZING Flight DEALS instantly search and book over 200 airlines "
                                                    ,style: TextStyle(fontSize:13,color: Colors.grey[600])))

                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right:10,
                                    bottom: 80,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Icon(Icons.airplanemode_active_outlined,color: Colors.white,size: 30,),
                                      decoration:BoxDecoration(
                                        color: Colors.yellow[900],
                                        borderRadius: BorderRadius.circular(50),
                                      ) ,
                                    )),
                                Positioned(
                                    left:10,
                                    top: 0,
                                    child: Text("3",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 180,
                                        color: Colors.red.withOpacity(0.1)),))
                              ],
                            ),
                          ),
                          /// Popular
                          Positioned(
                            left: 0,
                            bottom:0,
                            child: Stack(
                              children: [
                                Container(
                                  height: h*.17,
                                  width: w*.59,
                                ),
                                ClipPath(
                                  clipper: ClipperPopular(),
                                  child: Container(
                                    height: h*.17,
                                    width: w*.59,
                                    decoration: BoxDecoration(
                                      color:Colors.yellow[600],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 2,right: 2,top: 2,
                                  bottom: 2,
                                  child: ClipPath(
                                    clipper: ClipperPopular(),
                                    child: Container(
                                      height: h*.17,
                                      width: w*.5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25,top:20,),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 5,),
                                                Text("Popular",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                                                SizedBox(width: 5,),
                                                Text("Destinations",style: TextStyle(fontSize: 16,)),
                                              ],
                                            ),
                                            Container(
                                                width: 120,
                                                child: Text("A tourist attraction is place of interest where tourists visit. "
                                                    ,style: TextStyle(fontSize: 13)))

                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow[600],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 70,
                                    bottom: 70,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Icon(Icons.location_on_sharp,color: Colors.white,size: 30,),
                                      decoration:BoxDecoration(
                                        color: Colors.yellow[900],
                                        borderRadius: BorderRadius.circular(50),
                                      ) ,
                                    )),
                                Positioned(
                                    left: 5,
                                    top: -40,
                                    child: Text("2",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 180,
                                        color: Colors.red.withOpacity(0.15)),))
                              ],
                            ),
                          ),
                          Positioned(
                              bottom:0,
                              right: 0,
                              child: ClipPath(
                                  clipper: BottomClipper(),
                                  child: Container(
                                    width: w*.68,
                                    height: h*.19,
                                    color: Colors.yellow[700],
                                  ))),
                          Positioned(
                              bottom:0,
                              right: 0,
                              child: ClipPath(
                                  clipper: BottomClipperTwo(),
                                  child: Container(
                                    width: w*.68,
                                    height: h*.19,
                                    color: Colors.yellow[800],
                                  ))),
                          Positioned(
                              bottom: 10,
                              right: 0,

                              child: Container(
                                width: w*.5,
                                height: h*.08,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Icon(Icons.call,color: Colors.yellow[900],)),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Booking now",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                        Text(widget.tourTravelAllList[widget.i].tourTravelMobile!=null?widget.tourTravelAllList[widget.i].tourTravelMobile!:"",style:TextStyle(color: Colors.white)),
                                        Text(widget.tourTravelAllList[widget.i].tourTravelWebsite!=null?widget.tourTravelAllList[widget.i].tourTravelWebsite!:"",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                              right:50,
                              top:170,
                              child: Container(
                                width: h*.14,
                                height: h*.14,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    width: h*.13,
                                    height: h*.13,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("ROUND",style: TextStyle(color: Colors.white),),
                                        Text("TRIP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                        Text("OFFER",style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.black.withOpacity(.8)
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white
                                ),
                              )),
                          /// Rating and Time Schedules
                          Positioned(
                            right:10,
                            top: h*.17,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    IconButton(
                                        
                                        onPressed: (){
                                      showRating(rate: widget.tourTravelAllList[widget.i].rating!,context: context,id: widget.tourTravelAllList[widget.i].tourTravelId! );
                                    }, icon: Icon(Icons.star,color: Colors.yellow[900],size: 35,)),
                                    Positioned(
                                      right: 0,
                                        top: 5,
                                        child: Text(widget.tourTravelAllList[widget.i].rating!,style: TextStyle(
                                      color: Colors.black,fontSize: 12,
                                    ),))
                                  ],
                                ),
                                Text("Rate",style:TextStyle(color: Colors.black,fontSize: 10)),
                                SizedBox(height: 10,),
                                IconButton(onPressed: (){
                                  if( widget.tourTravelAllList[widget.i].tourTravelScheduleDetails!.tourTravelId!.isEmpty){
                                    return null;
                                  }else{
                                    showSchedules(tourAndTravelAllList: widget.tourTravelAllList[widget.i],context: context);
                                  }

                                }, icon: Icon(CupertinoIcons.clock,color:Colors.yellow[900],size: 35,)),
                                Text("Schedule",style:TextStyle(color: Colors.black,fontSize: 10))
                              ],
                            ),
                          )
                        ],
                      ),
            if(isSelectedPos==1)
              Column(
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color:Colors.yellow[900],
                    child: Center(child: Text("Images",style: TextStyle(color: Colors.white),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height*.55,
                      child: (widget.split[0] != null &&
                          widget.split[0].isNotEmpty &&
                          widget.split[0].length > 0) &&widget.split[0].isNotEmpty
                          ? StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount:widget.split.length,
                        itemBuilder:
                            (BuildContext context, int index) =>
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                ),
                                child:widget.split[index] != null
                                    ? Image.network("https://softawork2.xyz/fandlApi/uploads/bazar/" + widget.split[index],
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
            if(isSelectedPos==2)
              Column(
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color:Colors.yellow[900],
                    child: Center(child: Text("About",style: TextStyle(color: Colors.white),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: w,
                      height: h*.55,
                      padding: EdgeInsets.all(10),
                      child: Text(widget.tourTravelAllList[widget.i].tourTravelDescription!=null?widget.tourTravelAllList[widget.i].tourTravelDescription!:"No description added yet"),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 1,color: Color(0xFFFF6F00))
                      ),
                    ),
                  )
                ],
              ),
            if(isSelectedPos==3)
              Column(
                  children:[
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color:Colors.yellow[900],
                      child: Center(child: Text("Contact",style: TextStyle(color: Colors.white),)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.4,
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
                    Container(
                        padding: EdgeInsets.all(10),
                        height: h*.15,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_rounded,color: Color(0xFFFF6F00),),
                                SizedBox(width: 5,),
                                Text(widget.tourTravelAllList[widget.i].tourTravelAddress!=null?widget.tourTravelAllList[widget.i].tourTravelAddress!:"")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.airplanemode_active_outlined,color: Color(0xFFFF6F00),),
                                SizedBox(width: 5,),
                                Text(widget.tourTravelAllList[widget.i].distance!)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.clock,color: Color(0xFFFF6F00),),
                                SizedBox(width: 5,),
                                Text(widget.tourTravelAllList[widget.i].time!)
                              ],
                            ),

                          ],
                        )
                    )
                  ]
              ),
            Spacer(),
            Stack(
              children: [
                Container(
                  height:100,
                ),
                Container(
                  height: 80,
                  child: FancyBottomNavigation(
                    circleColor: Colors.white,
                    activeIconColor:Colors.yellow[900],
                    initialSelection: 0,
                    barBackgroundColor:Colors.yellow[900],
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
                        isSelectedPos=position;
                      });
                    },
                  ),

                ),
                Positioned(
                    bottom: 0,
                    left:0,right:0,
                    child:Container(
                      color:Colors.yellow[900],
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
}


  class ContainerClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height - 250);
      path.quadraticBezierTo(
          size.width / 14, size.height-50, size.width / 2, size.height-50);
      path.quadraticBezierTo(
          size.width - size.width / 14, size.height-50, size.width, size.height - 250);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      return path;
    }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  }
  class ContainerClipperTwo extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height - 80);
      path.quadraticBezierTo(
          size.width / 4, size.height+25, size.width / 2, size.height-10);
      path.quadraticBezierTo(
          size.width+55 - size.width / 4, size.height-55, size.width-5, size.height - 230);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }
  }
  class ContainerClipperThree extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height - 120);
      path.quadraticBezierTo(
          size.width / 4, size.height, size.width / 2, size.height-40);
      path.quadraticBezierTo(
          size.width+25 - size.width / 4, size.height-100, size.width-100, size.height - 330);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }

  }
  class ClipperAmazing extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(40, size.height-40);
      path.lineTo(size.width-40,size.height- 20);
      path.lineTo(size.width, 40);
      path.close();
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }

  }
  class ClipperFlight extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0,size.height);
      path.moveTo(40,40);
      path.lineTo(0,size.height);
      path.lineTo(size.width-20,size.height-40);
      path.lineTo(size.width-30, 80);

      path.close();
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }

  }
  class ClipperPopular extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0,size.height);
      path.moveTo(20,0);
      path.lineTo(0,size.height);
      path.lineTo(size.width-80,size.height);
      path.lineTo(size.width-20,0);

      path.close();
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return true;
    }

  }
  class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width*.3,-10, size.width,size.height*.3);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
  class BottomClipperTwo extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width*.3,0, size.width,size.height*.5);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
