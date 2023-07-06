import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    'https://8e33b888-a13d-4f80-9e42-615849315b8f.abap.us10.hana.ondemand.com/sap/opu/odata4/sap/zui_uxteam_v4_5551/srvd/sap/z_expose_uxteam_5551/0001';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization':
          'Basic VEVTVF81NTUxOkVqV2lYZVR3UEFSdHZzRlNGWWVlbG5XTFhxTHJFbDVXcUtGcVN1L3I=',
      'Username': 'TEST_5551',
      'Password': 'EjWiXeTwPARtvsFSFYeelnWLXqLrEl5WqKFqSu/r',
      'Accept': 'application/json',
    };
    print(url.toString());
    var response = await client.get(url, headers: _headers);
    var jsonresponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonresponse;
    } else {
      //throw exception and catch it in UI
    }
  }

// POST
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  ///PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
