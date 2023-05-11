class UserModel {
  String? status;

  // String? message;
  Data? data;
  bool? isDone;

  UserModel({this.status, this.isDone, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    //message = json['message'];
    data = json['message'] != null ? Data.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    // data['message'] = message;
    data['message'] = this.data?.toJson();
    return data;
  }
}

class Data {
  dynamic id;
  dynamic name;
  String? email;
  String? password;
  dynamic type;
  String? token;

  // dynamic phone;
  // dynamic image;
  // dynamic points;
  // dynamic credit;

  // Data(
  //   {
  //   this.id,
  // this.name,
  //this.email,
  //this.phone,
  //this.image,
  //this.points,
  //this.credit,
  //this.token});
  Data.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    name = json['user_name'];
    email = json['user_email'];
    password = json['user_password'];
    type = json['user_type'];
    token = json['token'];
    // phone = json['phone'];
    // image = json['image'];
    // points = json['points'];
    // credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['user_name'] = name;
    data['user_email'] = email;
    data['user_password'] = password;
    data['user_type'] = type;
    data['token'] = token;
    // data['phone'] = phone;
    // data['image'] = image;
    // data['points'] = points;
    // data['credit'] = credit;
    return data;
  }
}
