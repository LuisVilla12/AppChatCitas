import 'package:chat_static/config/helpers/yes_no.dart';
import 'package:chat_static/domain/entities/Message.dart';
import 'package:chat_static/screens/widgets/her_message.dart';
import 'package:flutter/material.dart';

// Extiende del notificador
class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController=ScrollController();
  final GetYesOrNotAnswer getYesOrNotAnswer=GetYesOrNotAnswer();
  // Lista de mensajes
  List<Message> messagesList=[
    // Message(text:'Hola yo soy Luis Alberto' , fromWho: FromWho.me),
    // Message(text:'Hola ya desayunaste?' , fromWho: FromWho.me),
    //Message(text:'Hola ya desayunaste?' , fromWho: FromWho.hers),

  ];

  //Enviar mensaje
  Future<void>sendMessage(String text) async{
    final newMessage=Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    if(text.endsWith('?')){
      await herReply();
    }
    moveScrollToBottom();
    // Notifica que hay un cambio
    notifyListeners();
  }
  // funcion para scroll
  Future<void> moveScrollToBottom() async{
// Tener un margen de espera
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent , duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
  }

  // Funcion mensajes de ella
Future<void> herReply()async{
  final herMessage=await getYesOrNotAnswer.getAnswer();
  messagesList.add(herMessage);
  notifyListeners();
}
}
