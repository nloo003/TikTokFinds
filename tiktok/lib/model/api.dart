import 'item_model.dart';
import 'user_model.dart';
import 'wishlist_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<WishlistModel>> getWishList() async {
  try {
    var url = Uri.parse('http://10.0.2.2:4000/api/wishList/all');
    final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<WishlistModel> data = responseData
          .map((json) => WishlistModel.fromJson(json))
          .toList();
        
        // print(data);
        return data;
      }
      else {
        // debugPrint('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // debugPrint('Error: $e');
      return []; // Return an empty list in case of an exception
    }
  }

Future<List<WishlistModel>> getUserWishList(String userId) async {
  try {
    var url =
        Uri.parse('http://10.0.2.2:4000/api/wishList/userWishLists/$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      final List<WishlistModel> data =
          responseData.map((json) => WishlistModel.fromJson(json)).toList();

      return data;
    } else {
      // debugPrint('Request failed with status: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // debugPrint('Error: $e');
    return []; // Return an empty list in case of an exception
  }
}

Future<UserModel> getUser(String userId) async {
    try {
      var url = Uri.parse('http://10.0.2.2:4000/api/user/profile/${userId}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        
        final UserModel user = UserModel.fromJson(responseData);

        return user;
      }
      else {
        // debugPrint('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load user');
      }
    } catch (e) {
      // print('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<ItemModel> getItem(String itemId) async {
    try {
      var url = Uri.parse('http://10.0.2.2:4000/api/shopItem/${itemId}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final ItemModel item = ItemModel.fromJson(responseData);

        return item;
      }
      else {
        // debugPrint('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load item');
      }
    } catch (e) {
      // debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

Future<List<ItemModel>> getShopItemsByStoreName(String storeName) async {
  final url = Uri.parse('http://10.0.2.2:4000/api/shopItem/getByStoreName');
  
  // Create a map containing the request data
  final Map<String, dynamic> requestData = {
    "storeName": storeName,
  };

  // Encode the map to JSON
  final jsonData = jsonEncode(requestData);

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<ItemModel> data =
          responseData.map((json) => ItemModel.fromJson(json)).toList();
      return data;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to fetch shop items');
    }
  } catch (e) {
    // Handle any exceptions that may occur
    throw Exception('Error: $e');
  }
}

Future<void> addItemToWishlist(String wishListId, String itemId) async {
  final url = Uri.parse('http://10.0.2.2:4000/api/wishList/add');
  
  // Create a map containing the request data
  final Map<String, dynamic> requestData = {
    "wishListId": wishListId,
    "itemId": itemId,
  };

  // Encode the map to JSON
  final jsonData = jsonEncode(requestData);

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      return;

    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to update wishlist');
    }
  } catch (e) {
    // Handle any exceptions that may occur
    throw Exception('Error: $e');
  }
}