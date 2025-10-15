import 'package:flutter/material.dart';
import 'package:sa02_geolocator_api_image/models/photo_model.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({super.key});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  //lista com as photos
  List<PhotoModel> photos = [];

  //método apra tirar photo
  void takePicture() async{
    //chama o controlador para tirar photo
    setState(() {
      //adiciona a photo na lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: //gridView,
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                //mostra photo e as informações
              },
              child: Image.file(),
            );
          })
    );
  }
}