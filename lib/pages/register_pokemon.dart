import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

class RegisterPokemon extends StatelessWidget{
  const RegisterPokemon({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Register Pokemon",
      home: Scaffold (
        appBar: AppBar(
          title: Text("Register Pokemon"),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: [
          ImgSection()

            ],
          )
        )
        ,
      ),
    );
  }
}

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              // navigate back
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: Text('Back'),
          )
        ],
      ),
    );
  }
}

class ImgSection extends StatelessWidget{
  const ImgSection({super.key});

@override
Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height:150.0,
            width: 150.0,
            decoration:BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/sprite.png'),
                fit:BoxFit.fitHeight,
              )
            )
          ),
          Container(
              height:150.0,
              width: 150.0,
              decoration:BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage('assets/pokemon.png'),
                    fit:BoxFit.fitHeight,
                  )
              )
          )

        ],
      )
    );
}
}