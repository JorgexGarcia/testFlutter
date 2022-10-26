import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Map<String,dynamic>> componentes = [
      {
        'title' : 'Alertas',
        'icon': const Icon(Icons.message_outlined),
        'ruta': 'alert'
      },
      {
        'title' : 'Avatares',
        'icon': const Icon(Icons.account_circle_outlined),
        'ruta': 'avatar'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: ListView.builder(
        itemCount: componentes.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            margin: const EdgeInsets.all(7),
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, componentes[index]['ruta']);
              },
              title: Text(componentes[index]['title']),
              leading: componentes[index]['icon'],
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          );
        },
      ),
    );
  }
}
