import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pokedex"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImgSection(),
              TextSection(),
              PokemonDetails(),
              AnotherView(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnotherView extends StatefulWidget {
  const AnotherView({super.key});

  @override
  _AnotherViewState createState() => _AnotherViewState();
}

class _AnotherViewState extends State<AnotherView> {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: Text('Back'),
          )
        ],
      ),
    );
  }
}

class ImgSection extends StatelessWidget {
  const ImgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        height: 200.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pokedex.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Pokemon Name: Greninja",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          Text(
            "Pokemon Number: 658",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ]));
  }
}

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Type: Water/Dark',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Abilities: Torrent, Protean',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description: Greninja is a Water/Dark type Pokémon introduced in Generation 6. It is known as the Ninja Pokémon.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
