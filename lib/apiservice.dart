import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://alpha.bytesdelivery.com/api/v3/product/category-products";
  
  Future<Map<String, dynamic>?> fetchProducts(int categoryId, int page) async {
    final String url = "$baseUrl/$categoryId/null/$page";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data["success"] == true) {
          return data["data"];
        }
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return null;
  }
}
