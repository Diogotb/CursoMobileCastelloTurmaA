import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/clima_model.dart';

class ClimaController {
  final String _apiKey = "90290436d34bb91b4d852afe49197129"; //sua Chave da API

  // método busca (get)
  Future<ClimaModel?> buscarClima (String cidade) async{
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$_apiKey&units=metric&lang=pt_br"
    );
    final response = await http.get(url);
    if(response.statusCode == 200){
      final dados = json.decode(response.body);
      return ClimaModel.fromJson(dados);
    }else{
      return null;
    }
  } 

}