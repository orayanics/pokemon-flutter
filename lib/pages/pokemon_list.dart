import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

class PokemonList extends StatelessWidget{
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Pokemon List",
      home: Scaffold (
        appBar: AppBar(
          title: Text("Pokemon List"),
        ),
        body: PokeList(),
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