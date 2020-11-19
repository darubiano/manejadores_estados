import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/models/Usuario.dart';
// Padre
part 'UsuarioState.dart';

class UsuarioCubit extends Cubit<UsuarioState>{
  // Estado inicial
  UsuarioCubit() : super(UsuarioInitial());
  void seleccionarUsuario (Usuario user){
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad:25);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
    final currentState = state;
    if(currentState is UsuarioActivo){
      final newProfesiones = [
        // Extraer profreciones
        ...currentState.usuario.profesiones,
        'Profesion ${currentState.usuario.profesiones.length +1}'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }

}