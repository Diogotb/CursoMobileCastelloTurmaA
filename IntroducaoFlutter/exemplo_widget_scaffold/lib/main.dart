import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo Scaffold"),
          actions: [
            IconButton(
              onPressed:() => print("Clicou Lupa"), 
              icon: Icon(Icons.search)),
            IconButton(
              onPressed: () => print("Clicou Sino"), 
              icon: Icon(Icons.notifications))],
        ),
        body: Center(
          child: Text("Conteúdo do Body"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "seta"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "perfil")
          ]),
        drawer: Drawer(
          child: ListView(
            children: [
              Text("Primeiro Item do Drawer"),
              Text("Segundo Item do Drawer"),
              Text("Terceiro Item do Drawer"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){print("Botão + Pressionado");},
          child: Icon(Icons.add),),
      ),
    );
  }
  
}