import 'item_model.dart';

class WishlistModel {
  String? id;
  String? name;
  String? description;
  List<String>? items;
  String? creatorId;
  String? creatorName;
  String? wishListImage;

  WishlistModel(this.id, this.name, this.description, this.items, this.creatorId, this.creatorName, this.wishListImage);

  factory WishlistModel.fromJson(Map<String, dynamic> json) {

    return WishlistModel(
      json['id'],
      json['name'],
      json['description'],
      List<String>.from(json['items']),
      json['creatorId'],
      json['creatorName'],
      json['wishListImage'],
    );
  }
}