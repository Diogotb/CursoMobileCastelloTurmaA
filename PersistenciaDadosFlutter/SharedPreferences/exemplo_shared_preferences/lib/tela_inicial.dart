import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatefulWidget{ //tela com mudança de state
  _TelaInicialState createState() => _TelaInicialState(); //chama a mudança
}

class _TelaInicialState extends State<TelaInicial>{ //ação/construção do tela
  //atributos
  TextEditingController _nomeController = TextEditingController(); //variavel que recebe info do textField
  String _nome = "";
  bool _darkMode = false;

  //métodos

  @override
  void initState() { //roda antes de iniciar a tela
    // TODO: implement initState
   super.initState();
   _carregarPreferencias();
  }

  void _carregarPreferencias() async{  //roda de forma assincrona ( junto com outra função/método)
    //estabelecer conexão com a memoria(cache)
    SharedPreferences _prefs = await SharedPreferences.getInstance(); //instalar a dependencia/biblioteca
    _nome = _prefs.getString("nome") ?? ""; //buscar o nome do usuario
    _darkMode = _prefs.getBool("darkMode") ?? false; //buscar o modo de tela do usuario
    setState(() {
      
    });
  }

  void _salvarNome() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _nome = _nomeController.text.trim();
    if(_nome.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Informe um Nome Válido!!!")));
    }else{
      _prefs.setString("nome", _nome);
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nome do Usuário Atualizado!!!")));
        _nomeController.clear();
      });
    }
  }

  void _salvarModoEscuro() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();//estabelecer conexão om a memória interna (shared Preferences)
    _darkMode = !_darkMode;
    _prefs.setBool("darkMode", _darkMode);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Modo Escuro ${_darkMode ? "Ativado" : "Desativado"}")));
    });

  }

  @override
  Widget build(BuildContext context){ //construtor de estrutura
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-Vindo ${_nome=="" ? "Visitante" : _nome}"),
          actions: [
            IconButton(
              onPressed: _salvarModoEscuro, 
              icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode))
          ],),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Informe Seu Nome"),
              ),
              ElevatedButton(
                onPressed: _salvarNome, 
                child: Text("Salvar Nome do Usuário")),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/tarefas"), //navegar para a tela de tarefas
                child: Text("Tarefas do $_nome"),)
            ],
          ),
        ),
      ),
    );
  }

}