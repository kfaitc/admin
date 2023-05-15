import 'dart:convert';
import 'package:flutter/material.dart';
class SearchReponseModel {
  final String message;
  SearchReponseModel({
    required this.message,
  });
  factory SearchReponseModel.fromJson(Map<String, dynamic> json) {
    return SearchReponseModel(
      message: json["message"] ?? "",
    );
  }
}
class SearchModelRequest {
  String? provinceId;
  String? imageId;
  String? lat;
  String? logs;
  String? land;
  String? sqm;
  String? bed;
  String? bath;
  String? price;
  String? searchPublish;
  int? id;

  SearchModelRequest(
      {this.provinceId,
      this.imageId,
      this.lat,
      this.logs,
      this.land,
      this.sqm,
      this.bed,
      this.bath,
      this.price,
      this.searchPublish,
      this.id});

  SearchModelRequest.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    imageId = json['image_id'];
    lat = json['lat'];
    logs = json['logs'];
    land = json['land'];
    sqm = json['sqm'];
    bed = json['bed'];
    bath = json['bath'];
    price = json['price'];
    searchPublish = json['search_publish'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province_id'] = this.provinceId;
    data['image_id'] = this.imageId;
    data['lat'] = this.lat;
    data['logs'] = this.logs;
    data['land'] = this.land;
    data['sqm'] = this.sqm;
    data['bed'] = this.bed;
    data['bath'] = this.bath;
    data['price'] = this.price;
    data['search_publish'] = this.searchPublish;
    data['id'] = this.id;
    return data;
  }
}