//criação de uma aplicativo ToDoList com StateFulWidget
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:ToDoListApp()));
}

//criar a classe principal
// construir duas classes 
//1 classe chamar mudanças de estado
class ToDoListApp extends StatefulWidget{ 
  @override
  _ToDoListAppState createState() => _ToDoListAppState();
} 

//2 classe construção do build
class _ToDoListAppState extends State<ToDoListApp>{
  //atributos
  final TextEditingController _tarefaController = TextEditingController(); //obj para pegar o valor do texto
  List<Map<String,dynamic>> _tarefa = [];

  //build
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("Lista de Tarefas")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tarefaController, //obj para pegar o valor do texto
              decoration: InputDecoration(labelText: "Digite uma Tarefa"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _adicionarTarefa, 
              child: Text("Adicionar Tarefa")
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefa.length,
                itemBuilder: (context,index) => 
                  ListTile(
                    title: Text(_tarefa[index]["titulo"], 
                      style: TextStyle(
                        //condição para decoração do texto
                        decoration: _tarefa[index]["concluida"] ? TextDecoration.lineThrough : null,// operador ternário
                      ),),
                    leading: Checkbox(
                      value: _tarefa[index]["concluida"], 
                      onChanged: (bool? valor) => setState(() {
                        _tarefa[index]["concluida"] = valor!;
                      })),  
                  ) 
              ),
            ),
            ElevatedButton(
              onPressed: _removerConcluidas, 
              child: Text("Remover Concluídas"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red))
          ],
        ),
      ),
    );
  }

  void _adicionarTarefa() {
    if(_tarefaController.text.trim().isNotEmpty){
      setState(() {
        //para cada tarefa adicionada ( titulo, concluida)
        _tarefa.add({"titulo":_tarefaController.text,"concluida":false});
        _tarefaController.clear();
      });
    }
  }

  void _removerConcluidas() {
    setState(() {
      _tarefa.removeWhere((tarefa)=>tarefa["concluida"]);
    });
  }
}