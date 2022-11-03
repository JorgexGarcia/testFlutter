import 'package:flutter/material.dart';
import 'package:flutter03/pages/pasar_info2_pages.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  TextEditingController textEditingController = TextEditingController();

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Pág 1'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(32),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            ElevatedButton(onPressed: (){_enviarDatos();}, child: const Text('Enviar')),
            ElevatedButton(onPressed: (){_recibirDatos();}, child: const Text('Recibir')),
            Text(text)
          ],
        )
      ),
    );
  }

  _enviarDatos() {
    String textToSend = textEditingController.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(texto: textToSend)));
  }

  _recibirDatos() async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(texto: textEditingController.text)));
    setState(() {
      text = result;
    });
  }
}
