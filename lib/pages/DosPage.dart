import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejadores_estados/models/Usuario.dart';

class DosPage extends StatelessWidget {
  static const String id = 'Dos';
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<UsuarioBloc>(context, listen: true);
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
              onPressed: () {
                final newUser = new Usuario(nombre: 'David', edad: 24, profesiones: ['Fullstack Developer','Machine learning']);
                bloc.add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {
                bloc.add(CambiarEdad(25));
              },
            ),
            MaterialButton(
              child: Text('Añadir profesion', style: TextStyle(color:Colors.white),),
              color: Colors.blue,
              onPressed: () {
                bloc.add(AgregarProfesion('Nueva profesion'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
