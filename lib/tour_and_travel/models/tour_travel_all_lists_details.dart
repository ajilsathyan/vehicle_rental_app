/// status : 200
/// msg : "Success"
/// tourTravelAllListCount : 8
/// tourTravelAllList : [{"tour_travel_id":"1","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg1.png","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:32","modified_date":"2021-07-02 13:43:32","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"2","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg2.png","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:35","modified_date":"2021-07-02 13:43:35","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"3","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg3.png","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:38","modified_date":"2021-07-02 13:43:38","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"4","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg4.jpg","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:40","modified_date":"2021-07-02 13:43:40","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"5","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg1.png","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:42","modified_date":"2021-07-02 13:43:42","tour_travel_schedule_details":{"tour_travel_schedule_id":"3","tour_travel_id":"5","schedule_mon_opening":"10:00","schedule_mon_closing":"07:00","schedule_tue_opening":"10:00","schedule_tue_closing":"07:00","schedule_wed_opening":"10:00","schedule_wed_closing":"07:00","schedule_thu_opening":"10:00","schedule_thu_closing":"07:00","schedule_fri_opening":"10:00","schedule_fri_closing":"07:00","schedule_sat_opening":"10:00","schedule_sat_closing":"07:00","schedule_sun_opening":"10:00","schedule_sun_closing":"07:00","created_date":"2021-08-24 16:00:32","modified_date":"2021-08-24 16:00:32"},"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"6","tour_travel_user_id":"32","tour_travel_name":"Travel Name","tour_travel_mobile":"587452145","tour_travel_email":"travel@email.com","tour_travel_address":"Travel Address","tour_travel_website":"www.travel.cm","tour_travel_images":"timg2.png","tour_travel_service_type":"ALL","tour_travel_description":"Travel Description","popular_destination":"","tour_travel_status":"1","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-02 13:43:44","modified_date":"2021-07-02 13:43:44","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"18","tour_travel_user_id":"1","tour_travel_name":"TOUR name","tour_travel_mobile":"785412541","tour_travel_email":"Email","tour_travel_address":"Address","tour_travel_website":"Website","tour_travel_images":"tour_travel_1625469414_91851.jpg","tour_travel_service_type":"1","tour_travel_description":"","popular_destination":"","tour_travel_status":"","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-07-05 10:16:54","modified_date":"2021-07-05 10:16:54","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"},{"tour_travel_id":"19","tour_travel_user_id":"1","tour_travel_name":"TOUR name","tour_travel_mobile":"785412541","tour_travel_email":"Email","tour_travel_address":"Address","tour_travel_website":"Website","tour_travel_images":null,"tour_travel_service_type":"1","tour_travel_description":"","popular_destination":"","tour_travel_status":"","tour_travel_latitude":"","tour_travel_longitude":"","business_type":"service","created_date":"2021-08-24 12:39:43","modified_date":"2021-08-24 12:39:43","tour_travel_schedule_details":null,"rating":"0","distance":"0.0 km","time":"0 hours 0 mins"}]
/// pagination : {"total_rows":8,"total_pages":1,"per_page":10,"offset":0,"current_page_no":"1"}

class TourTravelAllListsDetails {
  int? status;
  String? msg;
  int? tourTravelAllListCount;
  List<TourTravelAllList>? tourTravelAllList;
  Pagination? pagination;

  TourTravelAllListsDetails({
      this.status, 
      this.msg, 
      this.tourTravelAllListCount, 
      this.tourTravelAllList, 
      this.pagination});

  TourTravelAllListsDetails.fromJson(dynamic json) {
    status = json["status"];
    msg = json["msg"];
    tourTravelAllListCount = json["tourTravelAllListCount"];
    if (json["tourTravelAllList"] != null) {
      tourTravelAllList = [];
      json["tourTravelAllList"].forEach((v) {
        tourTravelAllList?.add(TourTravelAllList.fromJson(v));
      });
    }
    pagination = json["pagination"] != null ? Pagination.fromJson(json["pagination"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["msg"] = msg;
    map["tourTravelAllListCount"] = tourTravelAllListCount;
    if (tourTravelAllList != null) {
      map["tourTravelAllList"] = tourTravelAllList?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map["pagination"] = pagination?.toJson();
    }
    return map;
  }

}



class Pagination {
  int? totalRows;
  int? totalPages;
  int? perPage;
  int? offset;
  String? currentPageNo;

  Pagination({
      this.totalRows, 
      this.totalPages, 
      this.perPage, 
      this.offset, 
      this.currentPageNo});

  Pagination.fromJson(dynamic json) {
    totalRows = json["total_rows"];
    totalPages = json["total_pages"];
    perPage = json["per_page"];
    offset = json["offset"];
    currentPageNo = json["current_page_no"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total_rows"] = totalRows;
    map["total_pages"] = totalPages;
    map["per_page"] = perPage;
    map["offset"] = offset;
    map["current_page_no"] = currentPageNo;
    return map;
  }

}


class TourTravelAllList {
  String? tourTravelId;
  String? tourTravelUserId;
  String? tourTravelName;
  String? tourTravelMobile;
  String? tourTravelEmail;
  String? tourTravelAddress;
  String? tourTravelWebsite;
  String? tourTravelImages;
  String? tourTravelServiceType;
  String? tourTravelDescription;
  String? popularDestination;
  String? tourTravelStatus;
  String? tourTravelLatitude;
  String? tourTravelLongitude;
  String? businessType;
  String? createdDate;
  String? modifiedDate;
  TourTravelScheduleDetails? tourTravelScheduleDetails;
  String? rating;
  String? distance;
  String? time;

  TourTravelAllList({
      this.tourTravelId, 
      this.tourTravelUserId, 
      this.tourTravelName, 
      this.tourTravelMobile, 
      this.tourTravelEmail, 
      this.tourTravelAddress, 
      this.tourTravelWebsite, 
      this.tourTravelImages, 
      this.tourTravelServiceType, 
      this.tourTravelDescription, 
      this.popularDestination, 
      this.tourTravelStatus, 
      this.tourTravelLatitude, 
      this.tourTravelLongitude, 
      this.businessType, 
      this.createdDate, 
      this.modifiedDate, 
      this.tourTravelScheduleDetails, 
      this.rating, 
      this.distance, 
      this.time});

  TourTravelAllList.fromJson(Map<String,dynamic> json) {
    tourTravelId = json["tour_travel_id"];
    tourTravelUserId = json["tour_travel_user_id"];
    tourTravelName = json["tour_travel_name"];
    tourTravelMobile = json["tour_travel_mobile"];
    tourTravelEmail = json["tour_travel_email"];
    tourTravelAddress = json["tour_travel_address"];
    tourTravelWebsite = json["tour_travel_website"];
    tourTravelImages = json["tour_travel_images"];
    tourTravelServiceType = json["tour_travel_service_type"];
    tourTravelDescription = json["tour_travel_description"];
    popularDestination = json["popular_destination"];
    tourTravelStatus = json["tour_travel_status"];
    tourTravelLatitude = json["tour_travel_latitude"];
    tourTravelLongitude = json["tour_travel_longitude"];
    businessType = json["business_type"];
    createdDate = json["created_date"];
    modifiedDate = json["modified_date"];
     tourTravelScheduleDetails = TourTravelScheduleDetails.fromJson(json["tour_travel_schedule_details"]!=null?json["tour_travel_schedule_details"]:{});
    rating = json["rating"];
    distance = json["distance"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tour_travel_id"] = tourTravelId;
    map["tour_travel_user_id"] = tourTravelUserId;
    map["tour_travel_name"] = tourTravelName;
    map["tour_travel_mobile"] = tourTravelMobile;
    map["tour_travel_email"] = tourTravelEmail;
    map["tour_travel_address"] = tourTravelAddress;
    map["tour_travel_website"] = tourTravelWebsite;
    map["tour_travel_images"] = tourTravelImages;
    map["tour_travel_service_type"] = tourTravelServiceType;
    map["tour_travel_description"] = tourTravelDescription;
    map["popular_destination"] = popularDestination;
    map["tour_travel_status"] = tourTravelStatus;
    map["tour_travel_latitude"] = tourTravelLatitude;
    map["tour_travel_longitude"] = tourTravelLongitude;
    map["business_type"] = businessType;
    map["created_date"] = createdDate;
    map["modified_date"] = modifiedDate;
    map["tour_travel_schedule_details"] = tourTravelScheduleDetails;
    map["rating"] = rating;
    map["distance"] = distance;
    map["time"] = time;
    return map;
  }

}

class TourTravelScheduleDetails {
  String? tourTravelScheduleId;
  String? tourTravelId;
  String? scheduleMonOpening;
  String? scheduleMonClosing;
  String? scheduleTueOpening;
  String? scheduleTueClosing;
  String? scheduleWedOpening;
  String? scheduleWedClosing;
  String? scheduleThuOpening;
  String? scheduleThuClosing;
  String? scheduleFriOpening;
  String? scheduleFriClosing;
  String? scheduleSatOpening;
  String? scheduleSatClosing;
  String? scheduleSunOpening;
  String? scheduleSunClosing;
  String? createdDate;
  String? modifiedDate;

  TourTravelScheduleDetails(
      {this.tourTravelScheduleId,
        this.tourTravelId,
        this.scheduleMonOpening,
        this.scheduleMonClosing,
        this.scheduleTueOpening,
        this.scheduleTueClosing,
        this.scheduleWedOpening,
        this.scheduleWedClosing,
        this.scheduleThuOpening,
        this.scheduleThuClosing,
        this.scheduleFriOpening,
        this.scheduleFriClosing,
        this.scheduleSatOpening,
        this.scheduleSatClosing,
        this.scheduleSunOpening,
        this.scheduleSunClosing,
        this.createdDate,
        this.modifiedDate});

  TourTravelScheduleDetails.fromJson(Map<String, dynamic> json) {
    tourTravelScheduleId = json['tour_travel_schedule_id'];
    tourTravelId = json['tour_travel_id'];
    scheduleMonOpening = json['schedule_mon_opening'];
    scheduleMonClosing = json['schedule_mon_closing'];
    scheduleTueOpening = json['schedule_tue_opening'];
    scheduleTueClosing = json['schedule_tue_closing'];
    scheduleWedOpening = json['schedule_wed_opening'];
    scheduleWedClosing = json['schedule_wed_closing'];
    scheduleThuOpening = json['schedule_thu_opening'];
    scheduleThuClosing = json['schedule_thu_closing'];
    scheduleFriOpening = json['schedule_fri_opening'];
    scheduleFriClosing = json['schedule_fri_closing'];
    scheduleSatOpening = json['schedule_sat_opening'];
    scheduleSatClosing = json['schedule_sat_closing'];
    scheduleSunOpening = json['schedule_sun_opening'];
    scheduleSunClosing = json['schedule_sun_closing'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tour_travel_schedule_id'] = this.tourTravelScheduleId;
    data['tour_travel_id'] = this.tourTravelId;
    data['schedule_mon_opening'] = this.scheduleMonOpening;
    data['schedule_mon_closing'] = this.scheduleMonClosing;
    data['schedule_tue_opening'] = this.scheduleTueOpening;
    data['schedule_tue_closing'] = this.scheduleTueClosing;
    data['schedule_wed_opening'] = this.scheduleWedOpening;
    data['schedule_wed_closing'] = this.scheduleWedClosing;
    data['schedule_thu_opening'] = this.scheduleThuOpening;
    data['schedule_thu_closing'] = this.scheduleThuClosing;
    data['schedule_fri_opening'] = this.scheduleFriOpening;
    data['schedule_fri_closing'] = this.scheduleFriClosing;
    data['schedule_sat_opening'] = this.scheduleSatOpening;
    data['schedule_sat_closing'] = this.scheduleSatClosing;
    data['schedule_sun_opening'] = this.scheduleSunOpening;
    data['schedule_sun_closing'] = this.scheduleSunClosing;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    return data;
  }
}