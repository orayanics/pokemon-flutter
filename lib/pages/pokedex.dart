import 'package:flutter/material.dart';
import 'package:activity_flutter/main.dart';
import 'package:activity_flutter/pages/home.dart';
import 'package:activity_flutter/pages/register_form.dart';
import 'package:activity_flutter/pages/register_pokemon.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset("assets/logo.png", width: 25, height: 25),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          title: const Text("Pokedex"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ImgTextSection(),
              PokemonDetails(),
              AnotherView(),
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(
              children: [DrwHeader(), DrwListView()],
            )),
      ),
    );
  }
}

class ImgTextSection extends StatelessWidget {
  const ImgTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white38,
            ),
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/pokedex.jpg', height: 200),
          ),
          const SizedBox(height: 10),
          const Text(
            "Pokemon Name: Greninja",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const Text(
            "Pokemon Number: 658",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
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
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Type: Water/Dark', style: TextStyle(color: Colors.black),),
                  Text('Abilities: Torrent, Protean', style: TextStyle(color: Colors.black),),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description: Greninja is a Water/Dark type Pokémon introduced in Generation 6. It is known as the Ninja Pokémon.',style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

class AnotherView extends StatelessWidget {
  const AnotherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                fixedSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                foregroundColor: Colors.white,
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}