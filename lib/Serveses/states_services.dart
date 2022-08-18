import 'dart:convert';

import 'package:covid_19_app/Models/countries_model.dart';
import 'package:covid_19_app/Models/world_states_model.dart';
import 'package:covid_19_app/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices{
  
  Future<WorldStatesModel> getWorldStatesApi() async{
    
    final response = await http.get(Uri.parse(AppUrl.worldstatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    }
    else {
       throw Exception("error");
    }
    
  }

  Future<List<dynamic>> getCountries() async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
      return data;
    }
    else {
      throw Exception("error");
    }

  }
  
}