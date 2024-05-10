import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? status;
  Data? data;

  ProfileModel({
    this.status,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? username;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? email;
  dynamic image;
  dynamic dateOfBirth;
  String? bloodGroup;
  String? place;
  String? phoneNumber;
  String? department;
  String? course;
  String? batch;
  int? startYear;
  int? endYear;
  String? barcode;

  Data({
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.image,
    this.dateOfBirth,
    this.bloodGroup,
    this.place,
    this.phoneNumber,
    this.department,
    this.course,
    this.batch,
    this.startYear,
    this.endYear,
    this.barcode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        image: json["image"],
        dateOfBirth: json["date_of_birth"],
        bloodGroup: json["blood_group"],
        place: json["place"],
        phoneNumber: json["phone_number"],
        department: json["department"],
        course: json["course"],
        batch: json["batch"],
        startYear: json["start_year"],
        endYear: json["end_year"],
        barcode: json["barcode"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "image": image,
        "date_of_birth": dateOfBirth,
        "blood_group": bloodGroup,
        "place": place,
        "phone_number": phoneNumber,
        "department": department,
        "course": course,
        "batch": batch,
        "start_year": startYear,
        "end_year": endYear,
        "barcode": barcode,
      };
}
