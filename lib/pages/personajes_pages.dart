import 'package:flutter/material.dart';
import 'package:flutter03/providers/provider.dart';
import 'package:flutter03/models/Personajes.dart';

class PersonajesPage extends StatelessWidget {
  PersonajesPage({Key? key}) : super(key: key);

  final HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: FutureBuilder(
        future: http.getAll(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Personajes>> snapshot){
            if(snapshot.hasData){
              return Text('Ya tengo datos');
            }else{
              return Text('Aún no tengo datos');
            }
        },
      ),
    );
  }
}
