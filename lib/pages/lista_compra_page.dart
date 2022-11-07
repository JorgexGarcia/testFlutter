import 'package:flutter/material.dart';
import 'package:flutter03/pages/add_articulo_page.dart';

import '../models/Articulo.dart';

class ListaCompraPage extends StatefulWidget {
  const ListaCompraPage({Key? key}) : super(key: key);

  @override
  State<ListaCompraPage> createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {

  List<Articulo> lista = [];
  double totalLista = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de la compra'),
        actions: [
          Text('Total: ${totalLista.toString()}'),
          const SizedBox(width: 10)
        ],
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
                    totalLista -= lista[index].total;
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
        onPressed: () async {
          final Articulo? articulo = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddArticulosPage()));
          if(articulo != null) {
            setState(() {
              lista.add(articulo);
              totalLista += articulo.total;
            });
          }
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}
