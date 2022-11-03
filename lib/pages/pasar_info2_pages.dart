
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {

  final String texto;

  const Page2({Key? key, required this.texto}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.texto),
            Padding(padding: const EdgeInsets.all(32),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            ElevatedButton(onPressed: (){_devolverDatos();}, child: const Text('Devolver'))
          ],
        ),
      ),
    );
  }

  _devolverDatos() {
    String textToSend = textEditingController.text;
    Navigator.pop(context, textToSend);
  }
}
