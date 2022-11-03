
import 'package:flutter/material.dart';
import 'package:flutter03/providers/provider.dart';
import 'package:flutter03/models/Personajes.dart';

class PersonajePage extends StatefulWidget {
  const PersonajePage({Key? key}) : super(key: key);

  @override
  State<PersonajePage> createState() => _PersonajePageState();
}

class _PersonajePageState extends State<PersonajePage> {

  late Future<Personajes> personaje;
  HttpService http = HttpService();

  @override
  void initState() {
    super.initState();
    personaje = http.getCharacters();
    setState(() {
      print(personaje);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personaje')
      ),
      body: FutureBuilder(
        future: personaje,
        builder: (BuildContext context, AsyncSnapshot<Personajes> snapshot){
          if(snapshot.hasData){

            return Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image(image: NetworkImage(snapshot.data!.image ?? ''),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(snapshot.data!.name ?? ''),
                      subtitle: Text(snapshot.data!.location!.name!),
                    )
                  ],
                ),
              ),
            );
          }else{
            print(snapshot.toString());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
