import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejadores_estados/models/Usuario.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario());
            },
          ),
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return InformacionUsuario(
              usuario: state.usuario,
            );
          } else {
            return Center(
              child: Text('No hay un usuario seleccionado'),
            );
          }
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
          /*ListTile(
            title: Text('Profesion 1'),
          ),*/
          Expanded(
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${usuario.profesiones[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
