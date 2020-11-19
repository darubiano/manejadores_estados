import 'package:flutter/material.dart';
import 'package:manejadores_estados/models/Usuario.dart';
import 'package:manejadores_estados/pages/DosPage.dart';
import 'package:manejadores_estados/services/UsuarioService.dart';
import 'package:provider/provider.dart';

class UnoPage extends StatelessWidget {
  static const String id = 'Uno';
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, DosPage.id),
      ),
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => usuarioService.removerUsuario()),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario,
            )
          : Center(
              child: Text('No hya usuario seleccionado'),
            ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({@required this.usuario});
  @override
  Widget build(BuildContext context) {
    //print(usuario.profesiones);
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
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profeciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          //ListTile(title: Text('Profesion 1')),
          // alponer ... desestructura el arreglo y devuelve el contiendo de widgets
          /*...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
          */
          Expanded(
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title:Text("${usuario.profesiones[index]}"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
