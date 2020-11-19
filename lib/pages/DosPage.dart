import 'package:flutter/material.dart';
import 'package:manejadores_estados/models/Usuario.dart';
import 'package:manejadores_estados/services/UsuarioService.dart';
import 'package:provider/provider.dart';

class DosPage extends StatelessWidget {
  static const String id = 'Dos';
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('${usuarioService.usuario.nombre}')
            : Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                // listen en false para no redibujar la pagina
                //final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                Usuario usuario = new Usuario(nombre: 'David', edad: 24, profesiones: ['Fullstack Developer', 'Machine learning', 'Deep Learning']);
                usuarioService.usuario = usuario;
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                //final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                if (usuarioService.existeUsuario) {
                  usuarioService.cambiarEdad(25);
                }
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
