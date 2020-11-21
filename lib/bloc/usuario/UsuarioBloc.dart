import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/models/Usuario.dart';

part "UsuarioState.dart";
part "UsuarioEvent.dart";

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState>{
  UsuarioBloc() : super(UsuarioState());
  
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) {
    print("Hola mundo");
  }
  
}