import 'package:apiapp/model1/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModelService {
  final String url = "https://reqres.in/api/users?page=2";

  Future<UserModel?> makeCall() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      UserModel myUser = UserModel.fromJson(jsonData);
      return myUser;
    }
    return null;
  }
}
