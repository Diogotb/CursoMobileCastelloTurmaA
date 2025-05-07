//projeto usando shared preferences
// memoria interna - que armazena dados simples {"chave" : valor} -> string, bool, int, double, listString
// criar uma aplicativo de todo-list usando shared preferences, armazenar info do usuario, modo claroEscuro, lista de tarefas

import 'package:exemplo_shared_preferences/tela_todo_list.dart';
import 'package:flutter/material.dart';

import 'tela_inicial.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/",
    theme: ThemeData(brightness: Brightness.light), //modo Claro
    darkTheme: ThemeData(brightness: Brightness.dark), //modo Escuro
    routes: {
      "/tarefas": (context) => TelaTodoList(),
      "/": (context) => TelaInicial()
    },
  ));
}