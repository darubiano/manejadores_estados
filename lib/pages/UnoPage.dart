import 'package:flutter/material.dart';
import 'package:manejadores_estados/pages/DosPage.dart';

class UnoPage extends StatelessWidget {
  static const String id = 'Uno';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, DosPage.id),
      ),
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: InformacionUsuario(),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            title: Text('Nombre:'),
          ),
          ListTile(
            title: Text('Edad:'),
          ),
          Text(
            'Profeciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            title: Text('Profesion 1'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
        ],
      ),
    );
  }
}
