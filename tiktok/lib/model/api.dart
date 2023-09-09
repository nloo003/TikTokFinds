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
      var url = Uri.parse('http://10.0.2.2:4000/api/wishList/userWishLists/${userId}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        final List<WishlistModel> data = responseData
          .map((json) => WishlistModel.fromJson(json))
          .toList();
        
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
      // debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }