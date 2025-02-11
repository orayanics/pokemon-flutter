import 'package:flutter/material.dart';

import 'package:activity_flutter/pages/home.dart';
import 'package:activity_flutter/pages/register_form.dart';
import 'package:activity_flutter/pages/register_pokemon.dart';
import 'package:activity_flutter/pages/another.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokemon App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pokemon App"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrwHeader(),
              DrwListView()
            ],
          )
        ),
      ),
    );
  }


}

class DrwHeader extends StatefulWidget{
  @override
  _DrwHeader createState() => _DrwHeader();
}

class _DrwHeader extends State<DrwHeader>{
  @override
  Widget build (BuildContext context){
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.red[200],
      ),
      child: Column(
          children:[
            CircleAvatar(
               backgroundColor: Colors.white,
                radius: 43.0,
      ),
    SizedBox(height:15),
    Text(
    "Pokemon App",
    style:TextStyle(
    color: Colors.white,
    fontSize:16,
    fontWeight: FontWeight.bold,
    )
    )
      ],
    ),
    );
  }
}

class DrwListView extends StatefulWidget{
  @override
  _DrwListView createState() => _DrwListView();
}

class _DrwListView extends State<DrwListView>{
  @override
  Widget build (BuildContext context){
      return Column(
      children: [
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        ListTile(
          title: Text("Register Trainer"),
          leading: Icon(Icons.list),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterForm()));
          },
        ),
        ListTile(
          title: Text("Register Pokemon"),
          leading: Icon(Icons.info),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPokemon()));
          },
        ),
        ListTile(
          title: Text("Pokemon Details"),
          leading: Icon(Icons.exit_to_app),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AnotherView()));
          },
        ),
      ],

    );
  }
}