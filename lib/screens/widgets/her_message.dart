import 'package:flutter/material.dart';
class HerMessage extends StatelessWidget {
  const HerMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // Asigna el color del tema que fue asignado 
    final colors = Theme.of(context).colorScheme;
    return Column(
      // Alinear los mensajes a la izquierda
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Container(
          decoration: BoxDecoration(color: colors.secondary, borderRadius: BorderRadius.circular(15)),
          child: const Padding(
            padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child:  Text('Hello, i am Iron Man', style: TextStyle(color: Colors.white)),
          ),
        ),
        // Dejer espacio entre mensajes
        const SizedBox(height: 5),
        _ImageMessage(),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _ImageMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
//    print(size);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network("https://yesno.wtf/assets/yes/9-6403270cf95723ae4664274db51f1fd4.gif", width: size.width*.7, height: 150, fit: BoxFit.cover, 
      loadingBuilder: (context, child, loadingProgress) {
        // Si ya cargo la imagen que la regrese
        if(loadingProgress==null) return child;
        // Caso contrario
        return Container(
          //width: size.width*.07,
          height: 150,
          child: Center(
            child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
          ),
        );
      },));
  }
}