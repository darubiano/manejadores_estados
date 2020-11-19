import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/bloc/usuario/UsuarioCubit.dart';
import 'package:manejadores_estados/models/Usuario.dart';

class DosPage extends StatelessWidget {
  static const String id = 'Dos';
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UsuarioCubit>(context);
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
              child: Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                
                final newUser = new Usuario(
                  nombre: 'David',
                  edad: 24,
                  profesiones: ['FullStack Developer', 'Machine learning'],
                );
                bloc.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                bloc.cambiarEdad(25);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                bloc.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
