import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  static final HttpHelper _helper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _helper;
  }

  final String authority = 'your-wiremock-id.mocklab.io'; // ganti!

  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    Uri url = Uri.https(authority, path);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);
    http.Response r = await http.post(url, body: post);
    return r.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    http.Response r = await http.put(url, body: put);
    return r.body;
  }
}
