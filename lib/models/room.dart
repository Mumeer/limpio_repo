import 'package:limpio/models/user_data.dart';

class Room {
  UserDataModel? creator;
  List<UserDataModel>? users;
  int? id;
  String? roomId;
  String? roomNo;
  String? displayNo;
  String? name;
  String? bacgroundImage;

  Room(
      {this.creator,
        this.users,
        this.id,
        this.roomId,
        this.roomNo,
        this.displayNo,
        this.name,
        this.bacgroundImage});

  Room.fromJson(Map<String, dynamic> json) {
    creator = UserDataModel.fromJson(json['creator']);
    if(json['users'] != null){
    users = json['users'].forEach((e) => UserDataModel.fromJson(json['users']));
    }
    id = json['id'];
    roomId = json['roomId'];
    roomNo = json['roomNo'];
    displayNo = json['displayNo'];
    name = json['name'];
    bacgroundImage = json['bacgroundImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator'] = this.creator!.toJson();
    if(users != null){
      data['users'] = this.users!.map((e) => e.toJson());
    }else{
      data['users'] = null;
    }
    data['id'] = this.id;
    data['roomId'] = this.roomId;
    data['roomNo'] = this.roomNo;
    data['displayNo'] = this.displayNo;
    data['name'] = this.name;
    data['bacgroundImage'] = this.bacgroundImage;
    return data;
  }
}
