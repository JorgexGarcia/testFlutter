import 'package:flutter/material.dart';
import 'package:flutter03/models/Articulo.dart';

class AddArticulosPage extends StatefulWidget {
  const AddArticulosPage({Key? key}) : super(key: key);

  @override
  State<AddArticulosPage> createState() => _AddArticulosPageState();
}

class _AddArticulosPageState extends State<AddArticulosPage> {

  TextEditingController _nombre = TextEditingController();
  TextEditingController _cantidad = TextEditingController();
  TextEditingController _precio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir articulo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nombreinput(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(child: _cantidadInput()),
                  const SizedBox(width: 10),
                  Flexible(child: _precioInput())
                ],
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: _nombre.text.isNotEmpty && _precio.text.isNotEmpty && _cantidad.text.isNotEmpty ?
                  (){
                    Articulo articulo = Articulo(_nombre.text, int.parse(_cantidad.text),double.parse(_precio.text));
                    Navigator.pop(context, articulo);
                  } : null,
                  child: const Text('Añadir')
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _nombreinput() {
    return TextField(
      controller: _nombre,
      onChanged: (value){
        setState(() {

        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0
          )
        ),
        label: Text('Nombre del articulo')
      ),
    );
  }

  Widget _cantidadInput() {
    return TextField(
      controller: _cantidad,
      onChanged: (value){
        setState(() {

        });
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0
              )
          ),
          label: Text('Cantidad del articulo')
      ),
    );
  }

  Widget _precioInput() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: _precio,
      onChanged: (value){
        setState(() {

        });
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0
              )
          ),
          label: Text('Precio del articulo')
      ),
    );
  }
}
