import 'package:chat_static/config/theme/app_theme.dart';
import 'package:chat_static/providers/chat_provider.dart';
import 'package:chat_static/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Envuelve todo el contexte con providers
    return MultiProvider(
      // Define el provider del chat
      providers:[
        ChangeNotifierProvider(create: (_)=> ChatProvider())
      ],
      child: MaterialApp(
        title: 'Chat estatico',
        // Quitar baner de prueba
        debugShowCheckedModeBanner: false,
        // Obtener el tema de la clase Apptheme del archivo de configuración y manda el color del tema
        theme: AppTheme(selectedColor: 2).theme(),
        // Widget que va a mostrar
        home: const ChatScreen()
      ),
    );
  }
}