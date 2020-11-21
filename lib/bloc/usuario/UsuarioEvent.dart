
part of 'UsuaroBloc.dart';

@immutable
abstract class UsuarioEvent{}


class ActivarUsuario extends UsuarioEvent{
  final Usuario usuario;
  ActivarUsuario(this.usuario);
  
  
}
