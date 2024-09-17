import 'package:chat_static/domain/entities/Message.dart';
import 'package:flutter/material.dart';

// Extiende del notificador
class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController=ScrollController();
  // Lista de mensajes
  List<Message> messagesList=[
    // Message(text:'Hola yo soy Luis Alberto' , fromWho: FromWho.me),
    // Message(text:'Hola ya desayunaste?' , fromWho: FromWho.me),
    Message(text:'Hola ya desayunaste?' , fromWho: FromWho.hers),

  ];

  //Enviar mensaje
  Future<void>sendMessage(String text) async{
    final newMessage=Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    // Notifica que hay un cambio
    notifyListeners();
  }
}