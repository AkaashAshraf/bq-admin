import 'package:bq_admin/config/constants.dart';
import 'package:http/http.dart' as http;

Future<dynamic> post(String url, dynamic body) async {
  try {
    var response =
        await http.post(Uri.parse(baseUrl + url), body: body, headers: {
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
    } else {
      return null;
    }
  } catch (e) {
    return e.toString();
  }
}

Future<dynamic> get(String url) async {
  try {
    var response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    });
    // print(response.body);
    // return response.statusCode;
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      return null;
    } else {
      return null;
    }
  } catch (e) {
    return e;
  }
}
