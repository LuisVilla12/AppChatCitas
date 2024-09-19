import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  // Leer cuando se modifica el valor del input
  final ValueChanged<String> onValue;
  const FieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // Control del input
    final textController=TextEditingController();
    // Dar enfoque
    final focusNode = FocusNode();
    // Extraer el color del tema
    final colors = Theme.of(context).colorScheme;
    // Estilos al input
    final outlineInputBorder=OutlineInputBorder(
      // Colocar el color y el redondeo
      borderSide: BorderSide(color: colors.primary), borderRadius: BorderRadius.circular(15)
    );

    final inputDecoration= InputDecoration(
        // Es el placehonder
        hintText: 'Escriba su mensaje',
        // Activar los bordes
        enabledBorder: outlineInputBorder,
        //Activar el focus
        focusedBorder: outlineInputBorder,
        //Llenar el fondo
        filled: true, 
        //Colocar un icono en la esquina
        suffixIcon: 
        IconButton(onPressed: (){
          final textValue=textController.value.text;
          if(textValue=='') return;
          // Llama el metodo
          onValue(textValue);
          // print(textValue);
          textController.clear();
        }, icon: const Icon(Icons.send_outlined)));
    
  
    return  TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      // Controlador del input
      controller: textController,
      // Activar decoración de la variable
      decoration: inputDecoration,
      // Notar cuando un valor cambia
      // onChanged: (value) {
      //   print('Cambio $value');
      // },
      onFieldSubmitted: (value){
        // print('Enviaste el formulario $value');
        // Limpiar input
        if (value=='') return;
        onValue(value);
        textController.clear();
        // Seguir con el enfoque
        focusNode.requestFocus();
        },
      );

  }
}