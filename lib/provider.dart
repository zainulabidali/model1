import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  final String apiUrl = "https://alpha.bytesdelivery.com/api/v3/product/category-products/123/null/1";

  List<Map<String, dynamic>> _categories = [];
  List<Map<String, dynamic>> _products = [];
  String _selectedCategory = "";
  bool _isLoading = false;
  String? _errorMessage;

  List<Map<String, dynamic>> get categories => _categories;
  List<Map<String, dynamic>> get products => _products;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch categories and products from API
  Future<void> fetchData() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["success"] == true) {
          // Parse categories
          _categories = List<Map<String, dynamic>>.from(data["data"]["categories"]);
          
          // Set first category as selected
          _selectedCategory = _categories.isNotEmpty ? _categories.first["title"] : "";
          
          // Parse products
          _products = List<Map<String, dynamic>>.from(data["data"]["products"]);

          _isLoading = false;
          notifyListeners();
        } else {
          throw Exception("Failed to fetch data");
        }
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (error) {
      _errorMessage = error.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Select a category and fetch its products
  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
