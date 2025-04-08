import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:FormularioApp()));
}

//classe FormularioApp()

class FormularioApp extends StatefulWidget{
  //linha para chamar o construtor sempre que tiver uma alteração de estado (setState) 
  @override
  _FormularioAppState createState() => _FormularioAppState();
}

//classe para construir a janela
class _FormularioAppState extends State<FormularioApp>{
  //atributos
  final _formKey = GlobalKey<FormState>(); //chave de Validação do Formulário
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _genero = "";
  double _idade = 0;
  bool _aceite = false;

  //métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //campo Nome
              TextFormField(
                decoration: InputDecoration(labelText:"Nome"),
                validator: (value) => value!.isNotEmpty ? null : "Digite seu Nome",//operador ternário
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(height: 15,),
              //Campo Email
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) => value!.contains("@") ? null : "Digite um email válido",
                onSaved: (value) => _email = value! ,
              ),
              SizedBox(height: 15,),
              //Campo Senha
              TextFormField(
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
                validator: (value) => value!.length>=6 ? null : "A senha deve ter no mínimo 6 char",
                onSaved: (value) => _senha = value!,
              ),
              SizedBox(height: 15,),
              //Selecionar Gênero
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "Outro"].map(
                  (String genero)=>DropdownMenuItem(
                    value: genero,
                    child: Text(genero))
                ).toList(), 
                onChanged: (value){},
                validator: (value) => value!.isNotEmpty ? null : "Selecione um gênero",
                onSaved: (value)=> _genero = value!,),
              SizedBox(height: 15,),
              //Slider Seleção Número
              //Selecionar Idade
              Text("Selecione sua Idade"),
              Slider(
                value: _idade,
                min:0, //valor minimo
                max: 99, //valor máximo
                divisions: 99, //nº de divisões - determina o valor individual
                label: _idade.round().toString(), 
                onChanged: (value) => setState(()=>_idade=value)),
              SizedBox(height: 15,),
              //Aceite dos Termos
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceito os Termos de Uso do App"), 
                onChanged: (value) => setState(() => _aceite = value!)),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _enviarCadastro, 
                child: Text("Enviar"))
            ],
          )),
        ),

    );
  }

  void _enviarCadastro() {
    if(_formKey.currentState!.validate() && _aceite){
      _formKey.currentState!.save();
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Dados do Formulário"),
          content: Column(
            children: [
              Text("Nome: $_nome"),
              Text("Email: $_email"),
              //colocar outros atributos
            ],
          ),
        ));
    }
  }
}