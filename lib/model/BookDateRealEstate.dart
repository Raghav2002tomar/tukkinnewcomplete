class BookdDate {
  int? status;
  String? message;
  Databooked? data;
  String? error;

  BookdDate({this.status, this.message, this.data, this.error});

  BookdDate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Databooked.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Databooked {
  List<PropertyBookingDate>? propertyBookingDate;

  Databooked({this.propertyBookingDate});

  Databooked.fromJson(Map<String, dynamic> json) {
    if (json['propertyBookingDate'] != null) {
      propertyBookingDate = <PropertyBookingDate>[];
      json['propertyBookingDate'].forEach((v) {
        propertyBookingDate!.add(new PropertyBookingDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.propertyBookingDate != null) {
      data['propertyBookingDate'] =
          this.propertyBookingDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropertyBookingDate {
  String? checkIn;
  String? checkOut;

  PropertyBookingDate({this.checkIn, this.checkOut});

  PropertyBookingDate.fromJson(Map<String, dynamic> json) {
    checkIn = json['check_in'];
    checkOut = json['check_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    return data;
  }
}