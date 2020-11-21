import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/models/Usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState>{
  UsuarioBloc() : super(UsuarioState());
  
  // se usa async* cuando es stream
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async*{
    print(event);
    if(event is ActivarUsuario){
      yield state.copyWith(usuario: event.usuario);
    }else if (event is CambiarEdad){
      yield state.copyWith(usuario: state.usuario.copyWith(edad:event.edad));
    } else if (event is AgregarProfesion){
      yield state.copyWith(usuario: state.usuario.copyWith(
        profesiones: [...state.usuario.profesiones, event.profesion]));
    }else if(event is BorrarUsuario){
      yield state.borrarUsuario();
    }
    
  }
  
}