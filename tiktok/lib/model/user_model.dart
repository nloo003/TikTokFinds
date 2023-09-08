// ignore_for_file: non_constant_identifier_names, unused_field

class UserModel {
  final String name;
  final String handle;
  final List<String> following;
  final List<String> followers;
  final double likes;
  final String _id;
  final String createdAt;
  final String updatedAt;
  final double _V;

  const UserModel(this.name, this.handle, this.following, this.followers,
      this.likes, this._id, this.createdAt, this.updatedAt, this._V);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        json['name'],
        json['handle'],
        json['following'],
        json['followers'],
        json['likes']?.toDouble(),
        json['_id'],
        json['createdAt'],
        json['updatedAt'],
        json['_V']?.toDouble());
  }
}
