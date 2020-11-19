import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manejadores_estados/pages/DosPage.dart';
import 'package:manejadores_estados/pages/UnoPage.dart';
import 'package:manejadores_estados/services/UsuarioService.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new UsuarioService(),),
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