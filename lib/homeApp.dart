
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'dart:developer'; //<-- tambien usamos este para debuguear

void main() {
  //stderr.write('Hay un error'); // <-- mensaje para el dev tools, no es permitido en entorno WEB
  //Simular en celular
  // stdout.write("Hola desde stdout");

  log("Mensaje del log");

  runApp(Center(
    child: Text(
      "Hola Mundo",
      textDirection: TextDirection.ltr,
    ),
  ));
}