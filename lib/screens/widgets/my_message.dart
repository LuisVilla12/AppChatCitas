import 'package:chat_static/domain/entities/Message.dart';
import 'package:flutter/material.dart';
class MyMessage extends StatelessWidget {
  final Message message;
  
  // Contructor principal
  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // final messageFinal=
    // Asigna el color del tema que fue asignado 
    final colors = Theme.of(context).colorScheme;
    return Column(
      // Alinear los mensajes a la izquierda
      crossAxisAlignment: CrossAxisAlignment.end ,
      children: [
        Container(
          decoration: BoxDecoration(color: colors.primary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child:  Text(message.text, style: const TextStyle(color: Colors.white)),
          ),
        ),
        // Dejer espacio entre mensajes
        const SizedBox(height: 10)
      ],
    );
  }
}