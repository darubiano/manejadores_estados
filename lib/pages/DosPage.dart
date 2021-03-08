import 'package:flutter/material.dart';
import 'package:manejadores_estados/models/Usuario.dart';
import 'package:manejadores_estados/services/UsuarioServices.dart';

class DosPage extends StatelessWidget {
  static const String id = 'Dos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
            title: StreamBuilder(
              stream: usuarioService.usuarioStream,
              builder: (BuildContext context, AsyncSnapshot<Usuario?> snapshot){
                return snapshot.hasData
                ? Text('Nombre: ${snapshot.data!.nombre}')
                : Text('Pagina 2');
              },
            ),
            centerTitle: true,
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {
                final usuario = new Usuario(nombre: 'David',edad: 24,);
                usuarioService.cargarUsuario(usuario);
              },
            ),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(25);
              },
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
