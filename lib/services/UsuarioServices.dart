import 'dart:async';

import 'package:manejadores_estados/models/Usuario.dart';

// Singleton
class _UsuarioService {
  Usuario _usuario;
  //Stream con el broadcast emite a todos los streams
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;
  bool get existeUsuario=>(this._usuario != null) ? true:false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user){
    this._usuario = user;
    // cargar el usuario al stream
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad){
    this._usuario.edad = edad;
    // cargar el usuario al stream
    _usuarioStreamController.add(this._usuario);
  }

  // Limpiar stream
  dispose(){
    _usuarioStreamController?.close();
  }

}


final usuarioService = new _UsuarioService();