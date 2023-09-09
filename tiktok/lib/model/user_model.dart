// ignore_for_file: non_constant_identifier_names, unused_field

class UserModel {
  String? id;
  String? name;
  String? handle;
  List<String>? following;
  List<String>? followers;
  double? likes;
  String? profilePicUrl;

  UserModel(this.id, this.name, this.handle, this.following, this.followers,
      this.likes, this.profilePicUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['_id'],
      json['name'],
      json['handle'],
      List<String>.from(json['following']),
      List<String>.from(json['followers']),
      json['likes'].toDouble(),
      json['profilePicUrl'],
    );
  }
}