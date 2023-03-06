void find() {}

class gle {
  PlusCode? plusCode;
  List<Results>? results;
  String? status;

  gle({this.plusCode, this.results, this.status});

  gle.fromJson(Map<String, dynamic> json) {
    plusCode = json['plus_code'] != null
        ? new PlusCode.fromJson(json['plus_code'])
        : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plusCode != null) {
      data['plus_code'] = this.plusCode!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_code'] = this.compoundCode;
    data['global_code'] = this.globalCode;
    return data;
  }
}

class Results {
  List<AddressComponents>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  List<String>? types;
  PlusCode? plusCode;

  Results(
      {this.addressComponents,
      this.formattedAddress,
      this.geometry,
      this.placeId,
      this.types,
      this.plusCode});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      addressComponents = <AddressComponents>[];
      json['address_components'].forEach((v) {
        addressComponents!.add(new AddressComponents.fromJson(v));
      });
    }
    formattedAddress = json['formatted_address'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    placeId = json['place_id'];
    types = json['types'].cast<String>();
    plusCode = json['plus_code'] != null
        ? new PlusCode.fromJson(json['plus_code'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressComponents != null) {
      data['address_components'] =
          this.addressComponents!.map((v) => v.toJson()).toList();
    }
    data['formatted_address'] = this.formattedAddress;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['place_id'] = this.placeId;
    data['types'] = this.types;
    if (this.plusCode != null) {
      data['plus_code'] = this.plusCode!.toJson();
    }
    return data;
  }
}

class AddressComponents {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponents({this.longName, this.shortName, this.types});

  AddressComponents.fromJson(Map<String, dynamic> json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long_name'] = this.longName;
    data['short_name'] = this.shortName;
    data['types'] = this.types;
    return data;
  }
}

class Geometry {
  Bounds? bounds;
  Northeast? location;
  String? locationType;
  Bounds? viewport;

  Geometry({this.bounds, this.location, this.locationType, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    bounds =
        json['bounds'] != null ? new Bounds.fromJson(json['bounds']) : null;
    location = json['location'] != null
        ? new Northeast.fromJson(json['location'])
        : null;
    locationType = json['location_type'];
    viewport =
        json['viewport'] != null ? new Bounds.fromJson(json['viewport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bounds != null) {
      data['bounds'] = this.bounds!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['location_type'] = this.locationType;
    if (this.viewport != null) {
      data['viewport'] = this.viewport!.toJson();
    }
    return data;
  }
}

class Bounds {
  Northeast? northeast;
  Northeast? southwest;

  Bounds({this.northeast, this.southwest});

  Bounds.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new Northeast.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new Northeast.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast!.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest!.toJson();
    }
    return data;
  }
}

class Northeast {
  double? lat;
  double? lng;

  Northeast({this.lat, this.lng});

  Northeast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}


// {
//    "plus_code" : {
//       "compound_code" : "GWH8+5V7 Phnom Penh, Cambodia",
//       "global_code" : "7P36GWH8+5V7"
//    },
//    "results" : [
//       {
//          "address_components" : [
//             {
//                "long_name" : "N31",
//                "short_name" : "N31",
//                "types" : [ "street_number" ]
//             },
//             {
//                "long_name" : "Saint 430",
//                "short_name" : "St 430",
//                "types" : [ "route" ]
//             },
//             {
//                "long_name" : "Khan Chamkar Mon",
//                "short_name" : "Khan Chamkar Mon",
//                "types" : [ "political", "sublocality", "sublocality_level_1" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "N31 St 430, Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.5277765,
//                   "lng" : 104.9174583
//                },
//                "southwest" : {
//                   "lat" : 11.5277018,
//                   "lng" : 104.9173652
//                }
//             },
//             "location" : {
//                "lat" : 11.5277368,
//                "lng" : 104.9174063
//             },
//             "location_type" : "ROOFTOP",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5290881302915,
//                   "lng" : 104.9187607302915
//                },
//                "southwest" : {
//                   "lat" : 11.5263901697085,
//                   "lng" : 104.9160627697085
//                }
//             }
//          },
//          "place_id" : "ChIJDUhCO8JQCTERlrLkhuAhpwM",
//          "types" : [ "premise" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "10",
//                "short_name" : "10",
//                "types" : [ "street_number" ]
//             },
//             {
//                "long_name" : "Saint 430",
//                "short_name" : "St 430",
//                "types" : [ "route" ]
//             },
//             {
//                "long_name" : "Khan Chamkar Mon",
//                "short_name" : "Khan Chamkar Mon",
//                "types" : [ "political", "sublocality", "sublocality_level_1" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "10 St 430, Phnom Penh, Cambodia",
//          "geometry" : {
//             "location" : {
//                "lat" : 11.5277891,
//                "lng" : 104.9175852
//             },
//             "location_type" : "ROOFTOP",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5291380802915,
//                   "lng" : 104.9189341802915
//                },
//                "southwest" : {
//                   "lat" : 11.5264401197085,
//                   "lng" : 104.9162362197085
//                }
//             }
//          },
//          "place_id" : "ChIJNR5fOsJQCTERK4_86uy-VdY",
//          "plus_code" : {
//             "compound_code" : "GWH9+42 Phnom Penh, Cambodia",
//             "global_code" : "7P36GWH9+42"
//          },
//          "types" : [ "street_address" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "31",
//                "short_name" : "31",
//                "types" : [ "street_number" ]
//             },
//             {
//                "long_name" : "Saint 430",
//                "short_name" : "St 430",
//                "types" : [ "route" ]
//             },
//             {
//                "long_name" : "Khan Chamkar Mon",
//                "short_name" : "Khan Chamkar Mon",
//                "types" : [ "political", "sublocality", "sublocality_level_1" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "31 St 430, Phnom Penh, Cambodia",
//          "geometry" : {
//             "location" : {
//                "lat" : 11.5279456,
//                "lng" : 104.9175189
//             },
//             "location_type" : "RANGE_INTERPOLATED",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5292945802915,
//                   "lng" : 104.9188678802915
//                },
//                "southwest" : {
//                   "lat" : 11.5265966197085,
//                   "lng" : 104.9161699197085
//                }
//             }
//          },
//          "place_id" : "Eh8zMSBTdCA0MzAsIFBobm9tIFBlbmgsIENhbWJvZGlhIhoSGAoUChIJ86R3OsJQCTERqi7qjEnKX_gQHw",
//          "types" : [ "street_address" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "GWH8+5V",
//                "short_name" : "GWH8+5V",
//                "types" : [ "plus_code" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "GWH8+5V Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.528,
//                   "lng" : 104.91725
//                },
//                "southwest" : {
//                   "lat" : 11.527875,
//                   "lng" : 104.917125
//                }
//             },
//             "location" : {
//                "lat" : 11.5279091,
//                "lng" : 104.9171695
//             },
//             "location_type" : "GEOMETRIC_CENTER",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5292864802915,
//                   "lng" : 104.9185364802915
//                },
//                "southwest" : {
//                   "lat" : 11.5265885197085,
//                   "lng" : 104.9158385197085
//                }
//             }
//          },
//          "place_id" : "GhIJhoX_GUoOJ0AR4Niz57I6WkA",
//          "plus_code" : {
//             "compound_code" : "GWH8+5V Phnom Penh, Cambodia",
//             "global_code" : "7P36GWH8+5V"
//          },
//          "types" : [ "plus_code" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "12",
//                "short_name" : "12",
//                "types" : [ "street_number" ]
//             },
//             {
//                "long_name" : "Saint 430",
//                "short_name" : "St 430",
//                "types" : [ "route" ]
//             },
//             {
//                "long_name" : "Khan Chamkar Mon",
//                "short_name" : "Khan Chamkar Mon",
//                "types" : [ "political", "sublocality", "sublocality_level_1" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "12 St 430, Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.528407,
//                   "lng" : 104.9173877
//                },
//                "southwest" : {
//                   "lat" : 11.5280135,
//                   "lng" : 104.9168093
//                }
//             },
//             "location" : {
//                "lat" : 11.5281999,
//                "lng" : 104.9170913
//             },
//             "location_type" : "GEOMETRIC_CENTER",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5295592302915,
//                   "lng" : 104.9184474802915
//                },
//                "southwest" : {
//                   "lat" : 11.5268612697085,
//                   "lng" : 104.9157495197085
//                }
//             }
//          },
//          "place_id" : "ChIJ_wC0P8JQCTER5AhHsW_f3ZY",
//          "types" : [ "route" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Sangkat Phsar Daeum Thkov",
//                "short_name" : "Sangkat Phsar Daeum Thkov",
//                "types" : [ "administrative_area_level_3", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Sangkat Phsar Daeum Thkov, Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.5347291,
//                   "lng" : 104.9271238
//                },
//                "southwest" : {
//                   "lat" : 11.525696,
//                   "lng" : 104.9138791
//                }
//             },
//             "location" : {
//                "lat" : 11.530986,
//                "lng" : 104.9199043
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5347291,
//                   "lng" : 104.9271238
//                },
//                "southwest" : {
//                   "lat" : 11.525696,
//                   "lng" : 104.9138791
//                }
//             }
//          },
//          "place_id" : "ChIJca0ea8NQCTERDBPBKCPVGeU",
//          "types" : [ "administrative_area_level_3", "political" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Chamkarmon",
//                "short_name" : "Chamkarmon",
//                "types" : [ "administrative_area_level_2", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Chamkarmon, Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.5581051,
//                   "lng" : 104.951477
//                },
//                "southwest" : {
//                   "lat" : 11.525696,
//                   "lng" : 104.8980711
//                }
//             },
//             "location" : {
//                "lat" : 11.548878,
//                "lng" : 104.9213643
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5581051,
//                   "lng" : 104.951477
//                },
//                "southwest" : {
//                   "lat" : 11.525696,
//                   "lng" : 104.8980711
//                }
//             }
//          },
//          "place_id" : "ChIJXTZTdd9QCTERoTv__J641-w",
//          "types" : [ "administrative_area_level_2", "political" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Khan Chamkar Mon",
//                "short_name" : "Khan Chamkar Mon",
//                "types" : [ "political", "sublocality", "sublocality_level_1" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Khan Chamkar Mon, Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.5576719,
//                   "lng" : 104.9525535
//                },
//                "southwest" : {
//                   "lat" : 11.5266093,
//                   "lng" : 104.8985124
//                }
//             },
//             "location" : {
//                "lat" : 11.548878,
//                "lng" : 104.9213643
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.5576719,
//                   "lng" : 104.9525535
//                },
//                "southwest" : {
//                   "lat" : 11.5266093,
//                   "lng" : 104.8985124
//                }
//             }
//          },
//          "place_id" : "ChIJhdLUEydRCTER4qQtyi_PlXs",
//          "types" : [ "political", "sublocality", "sublocality_level_1" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.736511,
//                   "lng" : 105.049072
//                },
//                "southwest" : {
//                   "lat" : 11.421509,
//                   "lng" : 104.7127079
//                }
//             },
//             "location" : {
//                "lat" : 11.5448729,
//                "lng" : 104.8921668
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.736511,
//                   "lng" : 105.049072
//                },
//                "southwest" : {
//                   "lat" : 11.421509,
//                   "lng" : 104.7127079
//                }
//             }
//          },
//          "place_id" : "ChIJ42tqxz1RCTERx8C0yzzBvk8",
//          "types" : [ "administrative_area_level_1", "political" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "PP",
//                "types" : [ "locality", "political" ]
//             },
//             {
//                "long_name" : "Phnom Penh",
//                "short_name" : "Phnom Penh",
//                "types" : [ "administrative_area_level_1", "political" ]
//             },
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Phnom Penh, Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 11.7363275,
//                   "lng" : 105.0675774
//                },
//                "southwest" : {
//                   "lat" : 11.422401,
//                   "lng" : 104.7127961
//                }
//             },
//             "location" : {
//                "lat" : 11.5563738,
//                "lng" : 104.9282099
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 11.7363275,
//                   "lng" : 105.0675774
//                },
//                "southwest" : {
//                   "lat" : 11.422401,
//                   "lng" : 104.7127961
//                }
//             }
//          },
//          "place_id" : "ChIJ42tqxz1RCTERuyW1WugOAZw",
//          "types" : [ "locality", "political" ]
//       },
//       {
//          "address_components" : [
//             {
//                "long_name" : "Cambodia",
//                "short_name" : "KH",
//                "types" : [ "country", "political" ]
//             }
//          ],
//          "formatted_address" : "Cambodia",
//          "geometry" : {
//             "bounds" : {
//                "northeast" : {
//                   "lat" : 14.6901791,
//                   "lng" : 107.627687
//                },
//                "southwest" : {
//                   "lat" : 9.6007,
//                   "lng" : 102.333542
//                }
//             },
//             "location" : {
//                "lat" : 12.565679,
//                "lng" : 104.990963
//             },
//             "location_type" : "APPROXIMATE",
//             "viewport" : {
//                "northeast" : {
//                   "lat" : 14.6901791,
//                   "lng" : 107.627687
//                },
//                "southwest" : {
//                   "lat" : 9.6007,
//                   "lng" : 102.333542
//                }
//             }
//          },
//          "place_id" : "ChIJQzfc1L-HBzERUxL0ieC_t-Q",
//          "types" : [ "country", "political" ]
//       }
//    ],
//    "status" : "OK"
// }