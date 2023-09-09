class ItemModel {
  String? itemId;
  String? itemName;
  double? itemPrice;
  String? itemImage;
  String? itemStore;

  ItemModel(this.itemId, this.itemName, this.itemPrice, this.itemImage, this.itemStore);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      json['id'],
      json['name'],
      json['price']?.toDouble(),
      json['imageUrl'],
      json['store'],
    );
  }
}