// ignore_for_file: non_constant_identifier_names, unused_field

class UserModel {
  final String _id;
  final String name;
  final String handle;
  final List<String> following;
  final List<String> followers;
  final double likes;
  final String profilePicUrl;

  const UserModel(this._id,this.name, this.handle, this.following, this.followers,
      this.likes, this.profilePicUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['_id'],
      json['name'],
      json['handle'],
      List<String>.from(json['following']),
      List<String>.from(json['followers']),
      json['likes'].toDouble(),
      json['profilePicUrl']
    );
  }
}