import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dio/dio.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_rental/school_college/models/all_school_college_lists.dart';


class SchoolAllListsScreen extends StatefulWidget {
  @override
  _SchoolAllListsScreenState createState() => _SchoolAllListsScreenState();
}

class _SchoolAllListsScreenState extends State<SchoolAllListsScreen> {
  TextEditingController searchController = TextEditingController();
  var dio=Dio();
  List<SchoolCollegeAllList> schoolCollegeAllList=[];
  List<SchoolCollegeAllList> suggestionLists=[];
  List<SchoolCollegeAllList> searchList=[];
  List<SchoolCollegeAllList> filteredLists=[];
  GoogleMapController? mapController;
  List<String>rangeList=[];
  ScrollController _scrollController = new ScrollController();
  int pageNo=1;
  bool isFiltersApplied=false;
  String selectedRangeValues = "";
  bool isLoading =false;
  bool isSelected=false;
  int totalCount = 1;
  List<String>split=['https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2017/09/23/Pictures/_a6cc9944-a089-11e7-ba2d-20fa1b34073f.jpg',
    'https://greenmodelschool.com/wp-content/uploads/2021/01/gmhss-4.jpg',
    'https://www.ssshss.edu.in/images/infra_gallery/School.jpg',
    'https://greenmodelschool.com/wp-content/uploads/2021/01/gmhss-4.jpg',
  ];

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
          getSchoolCollegeAllLists();
        });
      // print("userrrrr" + _userID);
      // print("userRegistredId" + userRegistredId);
    } catch (e) {}
  }
  getSchoolCollegeAllLists()async{
    try {
      final response = await dio.get(
          "https://softawork2.xyz/fandlApi/school_college/get_school_college_all?page_no=1&user_id=31&distance_range=1000000");
      AllSchoolCollegeLists data =
      AllSchoolCollegeLists.fromJson(jsonDecode(response.toString()));
      if (response.statusCode == 200) {
        List<SchoolCollegeAllList> tempList = [];
        for (int i = 0; i <
            data.schoolCollegeAllList!.length; i++) {
          tempList.add(data.schoolCollegeAllList![i]);
        }
        setState(() {
          schoolCollegeAllList.addAll(tempList);
          print(schoolCollegeAllList.length);
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
          :filteredLists.length+1):schoolCollegeAllList.length + 1,
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

        if (i == (isFiltersApplied?filteredLists.length:schoolCollegeAllList.length)) {
          print(schoolCollegeAllList.length.toString() +
              "/" +
              i.toString() +
              "/" +
              9.toString());
          if (schoolCollegeAllList.length == totalCount) {
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
          String images = i < schoolCollegeAllList.length
              ? schoolCollegeAllList[i].schoolCollegeImages ?? ""
              : "";
          final split = images.split(',');
          print( schoolCollegeAllList.length);

         return CustomCard(i: i,allLists:isFiltersApplied?filteredLists:schoolCollegeAllList,split: split,);

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
        if (index == schoolCollegeAllList.length) {
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
          String images = index < schoolCollegeAllList.length
              ? schoolCollegeAllList[index].schoolCollegeImages ?? ""
              : "";
          final split = images.split(',');

          return CustomCard(i: index,allLists:isFiltersApplied?filteredLists:schoolCollegeAllList,split: split,);
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

    schoolCollegeAllList.forEach((v) {
      if ((v.schoolCollegeName!.toLowerCase().contains(text)) ||
          (v.schoolCollegeAddress!.toLowerCase().contains(text)) ||
          (v.schoolCollegeEmail!.toLowerCase().contains(text)))
        setState(() {
          suggestionLists.add(v);
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
                  hintText: 'Search schools & colleges', border: InputBorder.none),
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
        title: Text("School & College",style: TextStyle(color: Colors.black),),
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
                                isSelected = false;
                              });
                              filteredLists.clear();
                              schoolCollegeAllList.forEach((element) {
                                /// range
                                if (element.distance != null) {
                                  String kilometer = element.distance!.replaceAll(" Km", "").replaceAll(",", "");
                                  double data = double.parse(kilometer);
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
        height: 150,
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
              backgroundColor:Color(0xFFF9A825),
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
  final List<SchoolCollegeAllList> allLists;
  final split;
 CustomCard({this.split,required this.i,required this.allLists});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int isSelectedPos=0;
  GoogleMapController? mapController;
  double rating=0;

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        width: w,
        height: h * .78,
        child: Column(
          children: [
            if(isSelectedPos==0)
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
                                  "https://softawork2.xyz/fandlApi/uploads/bazar/" + widget.split[0]),
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
                              Text("Website: "+widget.allLists[widget.i].schoolCollegeWebsite!,style: TextStyle(fontSize: 9,color: Colors.white,),),
                              SizedBox(
                                  height: 25,
                                  width: 20,
                                  child: VerticalDivider(color: Colors.white,thickness: 2,)),
                              Text("Email: "+widget.allLists[widget.i].schoolCollegeEmail!,style: TextStyle(fontSize: 9,color: Colors.white,)),
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
                  Positioned(
                      right: 20,
                      top:h*.2,
                      child: Container(child: Column(
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.star,color:Color(0xFFFBC025),size: 30,),
                            ),
                            Positioned(
                                right: 5,
                                top: 5,
                                child: Text(widget.allLists[widget.i].rating==null?rating.toString():widget.allLists[widget.i].rating!,style: TextStyle(
                              fontSize: 8,
                            ),))
                          ],
                        ),
                      ),
                      Text("Rate",style: TextStyle(fontSize: 10),),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Icon(CupertinoIcons.clock,color:Color(0xFFFBC025),size: 35,),
                        ),
                      ),
                      Text("Schedule",style: TextStyle(fontSize: 10),),

                    ],
                  ),))


                ],
              ),
            if(isSelectedPos==1)
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
                    child: (widget.split[0] != null &&
                        widget.split[0].isNotEmpty &&
                        widget.split[0].length > 0) && widget.split[0].isNotEmpty
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
              ],),
            if(isSelectedPos==2)
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
                    child: Text(widget.allLists[widget.i].schoolCollegeDescription!.length!=0?widget.allLists[widget.i].schoolCollegeDescription!:""),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(width: 1,color: Color(0xFFF9A825))
                    ),
                  ),
                )
              ],),
            if(isSelectedPos==3)
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
                selectedIndex: isSelectedPos,
                backgroundColor: Color(0xFFFDD835),
                showElevation: true, // use this to remove appBar's elevation
                onItemSelected: (index) => setState(() {
                  isSelectedPos=index;
                }),
                items: [
                  BottomNavyBarItem(
                    icon: Icon(Icons.info,color: isSelectedPos==0?Colors.white:Colors.black,),
                    title: Text('info',style: TextStyle(color: Colors.white),),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.camera,color: isSelectedPos==1?Colors.white:Colors.black,),
                    title: Text('gallery',style: TextStyle(color: Colors.white)),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.person,color: isSelectedPos==2?Colors.white:Colors.black,),
                    title: Text('about',style: TextStyle(color: Colors.white)),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.location_on_rounded,color:isSelectedPos==3?Colors.white:Colors.black,),
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