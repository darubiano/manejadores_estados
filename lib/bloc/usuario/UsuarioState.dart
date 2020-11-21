part of 'UsuaroBloc.dart';

class UsuarioState {
  final existeUsuario;
  final Usuario usuario;
  UsuarioState({Usuario user})
      : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;
}
