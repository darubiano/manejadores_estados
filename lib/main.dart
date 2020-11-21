import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejadores_estados/pages/DosPage.dart';
import 'package:manejadores_estados/pages/UnoPage.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> new UsuarioBloc(),),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primaryColor:Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: UnoPage.id,
        routes: {
          UnoPage.id: (_)=>UnoPage(),
          DosPage.id: (_)=>DosPage(),
        },
      ),
    );
  }
}