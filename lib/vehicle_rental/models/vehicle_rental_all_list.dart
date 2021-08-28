import 'package:flutter/cupertino.dart';

/// status : 200
/// msg : "Success"
/// vehicleRentalAllListCount : 9
/// vehicleRentalAllList : [{"vehicle_id":"1","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg1.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:20","modified_date":"2021-07-02 13:45:20","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"2","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg2.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:22","modified_date":"2021-07-02 13:45:22","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"3","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg3.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:26","modified_date":"2021-07-02 13:45:26","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"4","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg5.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:28","modified_date":"2021-07-02 13:45:28","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"5","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg4.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:30","modified_date":"2021-07-02 13:45:30","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"6","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg3.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:32","modified_date":"2021-07-02 13:45:32","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"7","vehicle_user_id":"32","vehicle_company_name":"Vehicle Company Name","vehicle_person_name":"Vehicle Person","vehicle_email":"vehicle@email.com","vehicle_address":"Vehicle Address","vehicle_mobile":"587454744","vehicle_website":"www.vehicle.com","vehicle_images":"rentimg1.jpg","vehicle_type":"all","vehicle_per_charge":"521","vehicle_week_days_opening_time":"10:50","vehicle_week_days_closing_time":"10:50","vehicle_week_ends_opening_time":"10:50","vehicle_week_ends_closing_time":"10:50","vehicle_is_available":"yes","vehicle_description":"Vehicle Description","vehicle_status":"1","business_type":"service","created_date":"2021-07-02 13:45:34","modified_date":"2021-07-02 13:45:34","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"17","vehicle_user_id":"1","vehicle_company_name":"School College Name","vehicle_person_name":"College Name","vehicle_email":"Email","vehicle_address":"Address","vehicle_mobile":"785412541","vehicle_website":"Name","vehicle_images":"vehicle_rental_1625484460_78702.jpeg","vehicle_type":"","vehicle_per_charge":"","vehicle_week_days_opening_time":"","vehicle_week_days_closing_time":"","vehicle_week_ends_opening_time":"","vehicle_week_ends_closing_time":"","vehicle_is_available":"","vehicle_description":"","vehicle_status":"","business_type":"service","created_date":"2021-07-05 14:27:40","modified_date":"2021-07-05 14:27:40","vehicle_latitude":null,"vehicle_longitude":null},{"vehicle_id":"18","vehicle_user_id":"1","vehicle_company_name":"Company Name","vehicle_person_name":"Person Name","vehicle_email":"Email","vehicle_address":"Address","vehicle_mobile":"142541245","vehicle_website":"Website","vehicle_images":"vehicle_rental_1625544878_13983.jpeg","vehicle_type":"","vehicle_per_charge":"","vehicle_week_days_opening_time":"","vehicle_week_days_closing_time":"","vehicle_week_ends_opening_time":"","vehicle_week_ends_closing_time":"","vehicle_is_available":"","vehicle_description":"","vehicle_status":"","business_type":"service","created_date":"2021-07-06 07:14:38","modified_date":"2021-07-06 07:14:38","vehicle_latitude":null,"vehicle_longitude":null}]

class VehicleRentalAllLists {
  int? status;
  String? msg;
  int? vehicleRentalAllListCount;
  List<VehicleRentalAllList>? vehicleRentalAllList;

  VehicleRentalAllLists({
      this.status, 
      this.msg, 
      this.vehicleRentalAllListCount, 
      this.vehicleRentalAllList});

  VehicleRentalAllLists.fromJson(Map<String,dynamic> json) {
    status = json["status"];
    msg = json["msg"];
    vehicleRentalAllListCount = json["vehicleRentalAllListCount"];
    if (json["vehicleRentalAllList"] != null) {
      vehicleRentalAllList = [];
      json["vehicleRentalAllList"].forEach((v) {
        vehicleRentalAllList?.add(VehicleRentalAllList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["msg"] = msg;
    map["vehicleRentalAllListCount"] = vehicleRentalAllListCount;
    if (vehicleRentalAllList != null) {
      map["vehicleRentalAllList"] = vehicleRentalAllList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class VehicleRentalAllList {
  String? vehicleId;
  String? vehicleUserId;
  String? vehicleCompanyName;
  String? vehiclePersonName;
  String? vehicleEmail;
  String? vehicleAddress;
  String? vehicleMobile;
  String? vehicleWebsite;
  String? vehicleImages;
  String? vehicleType;
  String? vehiclePerCharge;
  String? vehicleWeekDaysOpeningTime;
  String? vehicleWeekDaysClosingTime;
  String? vehicleWeekEndsOpeningTime;
  String? vehicleWeekEndsClosingTime;
  String? vehicleIsAvailable;
  String? vehicleDescription;
  String? vehicleStatus;
  String? businessType;
  String? createdDate;
  String? modifiedDate;
  double? vehicleLatitude;
  double? vehicleLongitude;

  VehicleRentalAllList({
      this.vehicleId, 
      this.vehicleUserId, 
      this.vehicleCompanyName, 
      this.vehiclePersonName, 
      this.vehicleEmail, 
      this.vehicleAddress, 
      this.vehicleMobile, 
      this.vehicleWebsite, 
      this.vehicleImages, 
      this.vehicleType, 
      this.vehiclePerCharge, 
      this.vehicleWeekDaysOpeningTime, 
      this.vehicleWeekDaysClosingTime, 
      this.vehicleWeekEndsOpeningTime, 
      this.vehicleWeekEndsClosingTime, 
      this.vehicleIsAvailable, 
      this.vehicleDescription, 
      this.vehicleStatus, 
      this.businessType, 
      this.createdDate, 
      this.modifiedDate, 
      this.vehicleLatitude, 
      this.vehicleLongitude});

  VehicleRentalAllList.fromJson(Map<String,dynamic> json) {
    vehicleId = json["vehicle_id"];
    vehicleUserId = json["vehicle_user_id"];
    vehicleCompanyName = json["vehicle_company_name"];
    vehiclePersonName = json["vehicle_person_name"];
    vehicleEmail = json["vehicle_email"];
    vehicleAddress = json["vehicle_address"];
    vehicleMobile = json["vehicle_mobile"];
    vehicleWebsite = json["vehicle_website"];
    vehicleImages = json["vehicle_images"];
    vehicleType = json["vehicle_type"];
    vehiclePerCharge = json["vehicle_per_charge"];
    vehicleWeekDaysOpeningTime = json["vehicle_week_days_opening_time"];
    vehicleWeekDaysClosingTime = json["vehicle_week_days_closing_time"];
    vehicleWeekEndsOpeningTime = json["vehicle_week_ends_opening_time"];
    vehicleWeekEndsClosingTime = json["vehicle_week_ends_closing_time"];
    vehicleIsAvailable = json["vehicle_is_available"];
    vehicleDescription = json["vehicle_description"];
    vehicleStatus = json["vehicle_status"];
    businessType = json["business_type"];
    createdDate = json["created_date"];
    modifiedDate = json["modified_date"];
    vehicleLatitude = json["vehicle_latitude"];
    vehicleLongitude = json["vehicle_longitude"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["vehicle_id"] = vehicleId;
    map["vehicle_user_id"] = vehicleUserId;
    map["vehicle_company_name"] = vehicleCompanyName;
    map["vehicle_person_name"] = vehiclePersonName;
    map["vehicle_email"] = vehicleEmail;
    map["vehicle_address"] = vehicleAddress;
    map["vehicle_mobile"] = vehicleMobile;
    map["vehicle_website"] = vehicleWebsite;
    map["vehicle_images"] = vehicleImages;
    map["vehicle_type"] = vehicleType;
    map["vehicle_per_charge"] = vehiclePerCharge;
    map["vehicle_week_days_opening_time"] = vehicleWeekDaysOpeningTime;
    map["vehicle_week_days_closing_time"] = vehicleWeekDaysClosingTime;
    map["vehicle_week_ends_opening_time"] = vehicleWeekEndsOpeningTime;
    map["vehicle_week_ends_closing_time"] = vehicleWeekEndsClosingTime;
    map["vehicle_is_available"] = vehicleIsAvailable;
    map["vehicle_description"] = vehicleDescription;
    map["vehicle_status"] = vehicleStatus;
    map["business_type"] = businessType;
    map["created_date"] = createdDate;
    map["modified_date"] = modifiedDate;
    map["vehicle_latitude"] = vehicleLatitude;
    map["vehicle_longitude"] = vehicleLongitude;
    return map;
  }

}