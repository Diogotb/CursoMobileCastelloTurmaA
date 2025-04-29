import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

//construir a Janela
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Widget de Exibição"),),
      body: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Olá, Flutter!!!", 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue)), //texto Simples
                Text("Flutter é Incrível!!!", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    letterSpacing: 2
                  ),), // Texto Personalizado
                Icon(Icons.star, size: 50, color: Colors.amber,),
                IconButton(
                  onPressed: ()=> print("Icone Pressionado"), 
                  icon: Icon(Icons.notifications, size: 50,)),
                //Imagens
                Image.network("https://www.clubedecinema.pt/wp-content/uploads/2024/08/The-Dark-Knight-movie-reviews.png",
                height: 200,
                width: 200,
                fit: BoxFit.cover,),
                //Imagem Local
                Image.asset("assets/img/coringa.png",
                height: 200,
                width: 200,
                fit: BoxFit.cover,),
                //imagem arredondada
                ClipOval(
                  child: Image.asset("assets/img/coringa.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,),
                ) ,
                 
              ],
            ),
          ),
        ),
      )
    );
  }
  
}