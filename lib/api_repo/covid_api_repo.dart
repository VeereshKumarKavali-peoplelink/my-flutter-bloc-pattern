import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_bloc_pattern/models/covid_model.dart';


class CovidApiRepo {
  Future<List<CovidModel>> getLatestCovidData() async {
  
    try{
     var data =  await http.get(Uri.parse("https://api.covid19api.com/summary"));
     return (json.decode(data.body)["Countries"] as List).map((e) => CovidModel.fromJSON(e)).toList();
    }catch(e){
      throw Exception(e);
    }

    

  

  }
}