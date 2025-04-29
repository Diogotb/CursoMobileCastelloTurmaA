import 'package:flutter/material.dart';

import 'view/tela_cadastro.dart';
import 'view/tela_confirmacao.dart';
import 'view/tela_inicial.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => TelaInicial(),
      "/cadastro": (context) => TelaCadastro(),
      "/confirmacao": (context) => TelaConfirmacao()
    },
    initialRoute: "/",
  ));
}