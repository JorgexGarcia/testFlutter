

import 'dart:convert';

import 'package:flutter03/models/Personajes.dart';
import 'package:http/http.dart';

class HttpService{

  final String url = 'https://rickandmortyapi.com/api/character';

  Future<Personajes> getCharacters() async {

    Response res = await get(Uri.parse(url + '/1'));

    if(res.statusCode == 200){
      var a =  Personajes.fromJson(json.decode(res.body));
      print(a.toString());
      return a;
    }else{
      throw Exception('Fallo');
    }
  }

  Future<List<Personajes>> getAll() async {

    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200){

      List<dynamic> lista = jsonDecode(res.body)['results'];

      List<Personajes> personajes = lista.map((e) => Personajes.fromJson(e)).toList();

      return personajes;
    }else{
      throw Exception('Fallo');
    }
  }

}