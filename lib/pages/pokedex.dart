import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:activity_flutter/pages/accolades.dart';
import 'package:activity_flutter/pages/register_form.dart';
import 'package:activity_flutter/pages/register_pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:activity_flutter/validators/pokedex_validator.dart';
import 'dart:convert';


class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  String pokemonName = "Bulbasaur";
  String pokemonNumber = "1";
  String pokemonType = "GRASS/POISON";
  String pokemonAbilities = "OVERGROW, CHLOROPHYLL";
  String pokemonDescription =
      "Bulbasaur is a small, quadrupedal amphibian Pokémon that has blue-green skin with darker patches.";
  String pokemonImage =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png";

  bool _validatePokemon = false;
  String? _pokemonErrorText;

  void ValidateFields(String input) {
    setState(() {
      _pokemonErrorText = FieldValidators.validatePokemon(input);
      _validatePokemon = _pokemonErrorText != null;
    });
  }

  Future<void> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Fetch Pokémon species data for the description
      final speciesResponse = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon-species/${data['id']}"));
      String description = "No description available.";

      if (speciesResponse.statusCode == 200) {
        final speciesData = jsonDecode(speciesResponse.body);
        final flavorTextEntries = speciesData['flavor_text_entries'];

        // Ensure we find an English description
        var englishEntries = flavorTextEntries
            .where((entry) => entry['language']['name'] == 'en')
            .toList();

        if (englishEntries.isNotEmpty) {
          description = englishEntries.first['flavor_text']
              .replaceAll("\n", " ")
              .replaceAll("\f", " ");
        }
      }

      setState(() {
        _validatePokemon = false;
        _pokemonErrorText = null;
        pokemonName = data['name'].toString().toUpperCase();
        pokemonNumber = data['id'].toString();
        pokemonType = data['types']
            .map((type) => type['type']['name'])
            .join("/")
            .toUpperCase();
        pokemonAbilities = data['abilities']
            .map((ability) => ability['ability']['name'])
            .join(", ")
            .toUpperCase();
        pokemonImage = data['sprites']['other']['official-artwork']['front_default'] ??
            "https://via.placeholder.com/150";
        pokemonDescription = description; // Ensure this updates correctly
      });
    } else {
      setState(() {
        _pokemonErrorText = "Pokémon does not exist.";
        _validatePokemon = true;
      });
    }
  }


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
            children: [
              ImgTextSection(
                pokemonName: pokemonName,
                pokemonNumber: pokemonNumber,
                pokemonImage: pokemonImage,
                onSearch: fetchPokemon,
                validatePokemon: _validatePokemon,
                pokemonErrorText: _pokemonErrorText,
                validateFields: ValidateFields,
              ),
              PokemonDetails(
                type: pokemonType,
                abilities: pokemonAbilities,
                description: pokemonDescription,
              ),
              AnotherView(),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [DrwHeader(), DrwListView()],
          ),
        ),
      ),
    );
  }
}


class ImgTextSection extends StatelessWidget {
  final String? pokemonName;
  final String? pokemonNumber;
  final String pokemonImage;
  final Function(String) onSearch;
  final bool validatePokemon;
  final String? pokemonErrorText;
  final Function(String) validateFields;

  const ImgTextSection({
    super.key,
    required this.pokemonName,
    required this.pokemonNumber,
    required this.pokemonImage,
    required this.onSearch,
    required this.validatePokemon,
    required this.pokemonErrorText,
    required this.validateFields,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Enter Pokémon name or ID",
              errorText: validatePokemon ? pokemonErrorText : null,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  String searchText = searchController.text.trim().toLowerCase();
                  if (searchText.isEmpty) {
                    validateFields(searchText);
                    return;
                  }
                  onSearch(searchText);
                },
              ),

              filled: true,
              fillColor: Colors.white38,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.network(
              pokemonImage,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported, size: 100);
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Pokemon Name: $pokemonName",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          Text(
            "Pokemon Number: $pokemonNumber",
            style: const TextStyle(
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
  final String type;
  final String abilities;
  final String description;

  const PokemonDetails({
    super.key,
    required this.type,
    required this.abilities,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Type: $type',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Abilities: $abilities',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Description: $description',
                style: const TextStyle(color: Colors.black),
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
                fixedSize: const Size(200, 60),
                textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

class DrwHeader extends StatefulWidget {
  @override
  _DrwHeader createState() => _DrwHeader();
}

class _DrwHeader extends State<DrwHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      // change drawer icon to pkmnLogo
      decoration: BoxDecoration(
        color: Colors.red[900],
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 43.0,
          ),
          SizedBox(height: 15),
          Text("PokeWorld",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}

class DrwListView extends StatefulWidget {
  @override
  _DrwListView createState() => _DrwListView();
}

class _DrwListView extends State<DrwListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
        ),
        ListTile(
          title: Text("Register Trainer"),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterForm()));
          },
        ),
        ListTile(
          title: Text("Register Pokemon"),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPokemon()));
          },
        ),
        ListTile(
          title: Text("Pokedex"),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pokedex()));
          },
        ),
        ListTile(
          title: Text("Trainer Dashboard"),
          leading: Icon(Icons.abc_sharp),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Accolades()));
          },
        )
      ],
    );
  }
}
