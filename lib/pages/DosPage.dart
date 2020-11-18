import 'package:flutter/material.dart';

class DosPage extends StatelessWidget {
  static const String id = 'Dos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {},
            ),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {},
            ),
            MaterialButton(
              child: Text('Añadir profesion', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
