import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            shape: const StadiumBorder()
          ),
          onPressed: (){
            _showAlert(context);
          },
          child: const Text('Mostrar Alerta'),
        ),
      ),
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        if(Platform.isIOS){
          return CupertinoAlertDialog(
            title: const Text('Título del Alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Contenido del alert'),
                FlutterLogo(size: 100)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(),
                  child: const Text('Cancel')
              ),
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(),
                  child: const Text('Ok')
              )
            ],
          );
        }else{
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: const Text('Título del Alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Contenido del alert'),
                FlutterLogo(size: 100)
              ],
            ),
          );
        }
      }
    );
  }
}
