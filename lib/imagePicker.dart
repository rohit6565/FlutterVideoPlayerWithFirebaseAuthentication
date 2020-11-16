import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:hello/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Capture',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new HomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  File image;
  Future getImage() async{
    File picture =await ImagePicker.pickImage(
      source: ImageSource.camera,maximum:300.0,maxHeight:500.0);
      setState(()
      {
        image =picture;
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Camera'),
      ),
      body:Center(
        child:image==null
              ?Text('Click to take Pictures')
              :Image.file(image)
      ),
      floatingActionButton:floatingActionButton
      {
        onPressed:getImage(),
        tooltip:'Pick Image',
        child:Icon(Icons.add_a_photo),
      },
    );
  }
}
   