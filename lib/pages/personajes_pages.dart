
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
              List<Personajes> lista = snapshot.data ?? [];
              return ListView(
                children: lista.map((e) =>
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image(image: NetworkImage(e.image ?? ''),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: Text(e.name ?? ''),
                        subtitle: Text(e.location!.name!),
                      )
                    ],
                  ),
                )
                ).toList(),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
    );
  }
}
