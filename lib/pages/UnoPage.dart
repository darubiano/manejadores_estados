import 'package:flutter/material.dart';
import 'package:manejadores_estados/models/Usuario.dart';
import 'package:manejadores_estados/pages/DosPage.dart';
import 'package:manejadores_estados/services/UsuarioServices.dart';

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
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          // Si tiene un usuario hasData
          return snapshot.hasData
              ? InformacionUsuario(usuario: snapshot.data)
              : Center(child: Text('No hay informacion del usuario'));
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({this.usuario});
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
            title: Text('Nombre: ${this.usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${this.usuario.edad}'),
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
