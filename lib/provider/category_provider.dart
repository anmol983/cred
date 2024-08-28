import 'dart:convert';

import 'package:cred_app/models/category_item_model.dart';
import 'package:cred_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  bool isLoading = false;

  CategoryItem selectedCategory = CategoryItem(
      id: "id",
      name: "rewards",
      description: "redeem coins for cashbacks, discounts and more",
      icon:
          "https://d2tecn3vwkchpd.cloudfront.net/mobile-assets/merchants/823817e0b8e111ed8c4a15b837168c3f.png");

  List<Category> categories = [];

  Future<void> getCategories() async {
    isLoading = true;
    final url = Uri.parse("https://api.mocklets.com/p6839/explore-cred");

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      print(json.decode(response.body));
      final List<dynamic> sections = data["sections"];
      categories = sections.map((item) => Category.fromJson(item)).toList();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void selectCategory(CategoryItem categoryItem) {
    selectedCategory = categoryItem;
    notifyListeners();
  }
}
