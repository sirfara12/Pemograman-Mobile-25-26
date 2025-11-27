import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  final String authority = '24yrd.wiremockapi.cloud';
  final String path = '/pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    print('Fetching data from: $url');

    try {
      final http.Response result = await http.get(url);
      print('Status Code: ${result.statusCode}');

      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body);

        if (jsonResponse is List) {
          List<Pizza> pizzas =
              jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
          return pizzas;
        } else {
          print('Error: JSON response is not a list.');
          throw Exception('Invalid JSON structure.');
        }
      } else {
        throw Exception(
            'Failed to load pizza list. Status Code: ${result.statusCode}');
      }
    } catch (e) {
      print('Exception in getPizzaList: $e');
      rethrow;
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    
    String postBody = json.encode(pizza.toJson()); 

    Uri url = Uri.https(authority, postPath);
    
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"}, 
      body: postBody,
    );

    return response.body; 
  }
}