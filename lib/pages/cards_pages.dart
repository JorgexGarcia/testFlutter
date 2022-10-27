import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card page'),
      ),
      body: ListView(
        children: [
          _cardtype1(),
          _cardtype2(),
          _cardtype1(),
          _cardtype2(),
          _cardtype1(),
          _cardtype2(),
          _cardtype1(),
          _cardtype2(),
        ],
      ),
    );
  }

  Widget _cardtype1() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: FlutterLogo(),
            title: Text('Título del card'),
            subtitle: Text('A')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: (){},
                  child: const Text('Cancel')
              ),
              TextButton(
                  onPressed: (){},
                  child: const Text('Ok')
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardtype2() {
    return Card(
      shadowColor: const Color.fromARGB(255,130,130,5),
      color: Colors.amberAccent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Image(
            image: NetworkImage('https://www.trecebits.com/wp-content/uploads/2018/08/logo_one_icon.0-1-1.jpg'),
          ),
          const ListTile(
              leading: FlutterLogo(),
              title: Text('Título del card'),
              subtitle: Text('A')
          ),
          const Text('Contenido'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: (){},
                  child: Text('Cancel')
              ),
              TextButton(
                  onPressed: (){},
                  child: Text('Ok')
              ),
            ],
          )
        ],
      ),
    );
  }
}
