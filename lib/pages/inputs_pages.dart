import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({Key? key}) : super(key: key);

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  
  String nombre = '';
  bool temp = true;
  TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Pages'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          _nombreInput(),
          const Divider(),
          Text(nombre),
          const SizedBox(height: 20),
          _emailInput(),
          const SizedBox(height: 20),
          _passwordInput(),
          const SizedBox(height: 20),
          _datePickerInput()
        ],
      ),
    );
  }

  Widget _nombreInput() {
    return TextField(
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 10, color: Colors.lightGreenAccent),
          borderRadius: BorderRadius.circular(200),
        ),
        counterText: nombre.length.toString(),
        counterStyle: nombre.length >= 20 ? const TextStyle(color: Colors.red):
          const TextStyle(color: Colors.blue),
        hintText: 'Escribe tu nombre',
        label: const Text('Nombre'),
        helperText: 'Unicamente el nombre',
        icon: const Icon(Icons.construction),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 1, color: Colors.amber)
        )
      ),
      onChanged: (value){
        setState(() {
          nombre = value;
        });
      },
    );
  }

  Widget _emailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Escribe tu email',
        label: const Text('Email'),
        icon: const Icon(Icons.message_outlined)
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: temp,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          hintText: 'Escribe tu password',
          label: const Text('Contraseña'),
          icon: const Icon(Icons.password),
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              temp = !temp;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        )
      ),
    );
  }

  Widget _datePickerInput() {
    return TextField(
      controller: _inputDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          hintText: 'Escribe tu fecha',
          label: const Text('Fecha'),
          icon: const Icon(Icons.timer)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selecDate();
      },
    );
  }

  void _selecDate() async {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(3000),
      locale: Locale('en')
    );
    if(fechaSeleccionada != null){
      setState(() {
        try{
          _inputDateController.text = DateFormat('dd - MMM - yyyy').format(fechaSeleccionada);
        }catch (_){}
      });
    }
  }
}
