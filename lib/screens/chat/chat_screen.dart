// Importar materia
import 'package:chat_static/domain/entities/Message.dart';
import 'package:chat_static/main.dart';
import 'package:chat_static/providers/chat_provider.dart';
import 'package:chat_static/screens/widgets/field_box.dart';
import 'package:chat_static/screens/widgets/her_message.dart';
import 'package:chat_static/screens/widgets/my_message.dart';
import 'package:flutter/material.dart';
// Importar Provider
import 'package:provider/provider.dart';

// Importar StatelessWidget
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // regresar normalmente un scaffold
    return Scaffold(
      appBar: AppBar(
        // Padding asigna padding como en web y en child va lo que ira adentro
        leading: const Padding(padding: EdgeInsets.all(2), child:( CircleAvatar(backgroundImage: NetworkImage('https://playcontestofchampions.com/wp-content/uploads/2021/11/champion-iron-man-infinity-war-720x720.jpg'),))),  
        title: const Text('Iron Man'), centerTitle: false,),
        body: ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Observa los cambios del ChatProvider
    final chatProvider=context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            // Expanded funciona para ocupar el espacio que hay disponible
            Expanded(child: 
            ListView.builder(
              // El control del scrooll lo tenga el provider
              controller: chatProvider.chatScrollController,
              // La cantidad de mensajes en el provider
              itemCount: chatProvider.messagesList.length,//Cantidad de elementos
              //Construcción de elementos de la lista
              itemBuilder: (context, index){
                final message=chatProvider.messagesList[index];
                return (message.fromWho==FromWho.me? MyMessage(message:message):HerMessage(message:message));
              } )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              // Manda el valor que esta en el input a la función de sendMessage
              child: FieldBox(onValue: (value) => chatProvider.sendMessage(value),),
            )
          ],
        ),
      ),
    );
  }
}