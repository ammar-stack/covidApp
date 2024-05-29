import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newcovidapp/Models/allapi.dart';
import 'utlilities/appURLs.dart';

class StatesServices{
  Future<Allapi> fetchWorldStatus () async{
    final response = await http.get(Uri.parse(AppURL.worldStatus));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return Allapi.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesList () async{
    final response = await http.get(Uri.parse(AppURL.perCountriesStatus));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('Error');
    }
  }
}