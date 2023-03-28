class UserDataModel {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? bio;
  String? dateOfBirth;
  int? joinDate;

  UserDataModel(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.bio,
        this.dateOfBirth,
        this.joinDate});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['LastName'];
    profilePicture = json['profilePicture'];
    bio = json['bio'];
    dateOfBirth = json['dateOfBirth'];
    joinDate = json['joinDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['profilePicture'] = this.profilePicture;
    data['bio'] = this.bio;
    data['dateOfBirth'] = this.dateOfBirth;
    data['joinDate'] = this.joinDate;
    return data;
  }
}
