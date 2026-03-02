import 'package:flutter/material.dart';
import 'mispantallas/Inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Florería Ajolote',
    initialRoute: '/',
    routes: {
      '/': (context) => Inicio(),
      '/pantalla2': (context) => Pantalla2(),
      '/pantalla3': (context) => Pantalla3(),
    },
  ));
}