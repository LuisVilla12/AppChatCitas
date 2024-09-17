import 'package:flutter/material.dart';
// Definir color personalizado se tiene que agregar el 0xFF para colores personalizados
const Color _customColor=Color.fromARGB(255, 106, 28, 231);

const List<Color> _colorTheme=[
  _customColor, Colors.blueAccent, Colors.pinkAccent, Colors.yellow, Colors.greenAccent, Colors.black
];

class AppTheme{
  // Variable para la selección de color
  final int selectedColor;
  AppTheme({
    // asigna el color en la posición 0 y que lo requiere
    this.selectedColor=0
    // Assert para controlar las excepciones del index de los colores
  }):assert(selectedColor>=0 && selectedColor<=_colorTheme.length-1, 'Colores deben estar entre el 0 y el ${_colorTheme.length}');
  // Construir el tema personalizado
  ThemeData theme(){
    // Regresar el tema
    return ThemeData(
      // Asigna al tema el color seleccionado
      colorSchemeSeed: _colorTheme[selectedColor],
      // Activar el modo oscuro
      // brightness: Brightness.dark
    );

  }
}