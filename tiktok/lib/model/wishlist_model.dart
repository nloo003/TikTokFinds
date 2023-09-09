import 'item_model.dart';

class WishlistModel {
  String? id;
  String? name;
  String? description;
  List<ItemModel>? items;
  String? creatorId;
  String? creatorName;
  String? wishListImage;

  WishlistModel(this.id, this.name, this.description, this.items, this.creatorId, this.creatorName, this.wishListImage);
  // WishlistModel(this.name, this.description, this.items, this.creatorId, this.creatorName);

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? jsonItems = json['items'];
    List<ItemModel>? itemsList;

    if (jsonItems != null) {
      itemsList = jsonItems.map((item) => ItemModel.fromJson(item)).toList();
    }

    return WishlistModel(
      json['id'],
      json['name'],
      json['description'],
      itemsList,
      json['creatorId'],
      json['creatorName'],
      json['wishListImage'],
    );
  }
}