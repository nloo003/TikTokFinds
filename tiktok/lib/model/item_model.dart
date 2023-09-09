class ItemModel {
  String? itemId;
  String? itemName;
  double? itemPrice;
  String? itemImage;

  ItemModel(this.itemId, this.itemName, this.itemPrice, this.itemImage);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      json['itemId'],
      json['itemName'],
      json['itemPrice']?.toDouble(),
      json['itemImage'],
    );
  }
}