import 'package:flutter/material.dart';

import '../models/Articulo.dart';

class ListaCompraPage extends StatefulWidget {
  const ListaCompraPage({Key? key}) : super(key: key);

  @override
  State<ListaCompraPage> createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {

  List<Articulo> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de la compra'),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index){
          if(lista.isEmpty){
            return const Center(
              child: Text('Lista Vacia'),
            );
          }else{
            return ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text('${lista[index].nombre} - ${lista[index].cantidad}'),
              subtitle: Text('Total: ${lista[index].total} €'),
              trailing: GestureDetector(
                onLongPress: (){
                  setState(() {
                    lista.removeAt(index);
                  });
                },
                child: const Icon(Icons.delete_forever_outlined, color: Colors.red),
              ),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add)
      ),
    );
  }
}
