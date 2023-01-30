import 'dart:convert';

import 'package:apiapp/model2/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductService{

  final String url = "https://dummyjson.com/products";

  Future<ProductModel?> makeCall() async {
  var response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    var jsonData = jsonDecode(response.body);

    final ProductModel model = ProductModel.fromJson(jsonData);
    return model;
  }
  else {
    throw "errorrrr";
  }
}

}