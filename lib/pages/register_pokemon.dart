import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:activity_flutter/validators/pokemon_register_validator.dart';


final _pokemonName = TextEditingController();
bool _validateName = false;

final _pokemonLevel = TextEditingController();
bool _validateLevel = false;
String? _levelErrorText;

class RegisterPokemon extends StatefulWidget {
  RegisterPokemon({super.key});

  @override
  _RegisterPokemonState createState() => _RegisterPokemonState();
}

class _RegisterPokemonState extends State<RegisterPokemon> {
  final List<String> items = [
    'Normal', 'Fire', 'Water', 'Grass', 'Electric', 'Ice', 'Fighting',
    'Poison', 'Ground', 'Flying', 'Psychic', 'Bug', 'Rock', 'Ghost',
    'Dark', 'Dragon', 'Steel', 'Fairy'
  ];

  final GlobalKey<_InptFieldSectionState> _formKey = GlobalKey();

  void validateAndSubmit() {
    _formKey.currentState?.ValidateFields();

    if (!_formKey.currentState!._validateName && !_formKey.currentState!._validateLevel) {
      // If no validation errors, navigate to MyApp
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Register Pokemon",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          title: Text("Pokemon Registration"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [DrwHeader(), DrwListView()],
          ),
        ),

        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImgSection(),
                  SizedBox(height: 20),
                  InptFieldSection(key: _formKey, items: items, onValidate: () {}),
                  SizedBox(height: 80),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp())),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        fixedSize: const Size(150, 60),
                        textStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    label: Text('Back'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: validateAndSubmit, // Calls validation
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        fixedSize: Size(150, 60),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    label: Row(
                      children: [
                        Text('Submit'),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ImgSection extends StatelessWidget {
  const ImgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageContainer(imagePath: 'assets/sprite.png'),
        SizedBox(width: 20),
        ImageContainer(imagePath: 'assets/pokemon.png'),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;
  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class InptFieldSection extends StatefulWidget {
  final List<String> items;
  final VoidCallback onValidate;

  const InptFieldSection({super.key, required this.items, required this.onValidate});

  @override
  _InptFieldSectionState createState() => _InptFieldSectionState();
}


class _InptFieldSectionState extends State<InptFieldSection> {
  final TextEditingController _pokemonName = TextEditingController();
  bool _validateName = false;

  final TextEditingController _pokemonLevel = TextEditingController();
  bool _validateLevel = false;
  String? _levelErrorText;

  void ValidateFields() {
    setState(() {
      _validateName = FieldValidators.validatePokemonName(_pokemonName.text) != null;
      _levelErrorText = FieldValidators.validatePokemonLevel(_pokemonLevel.text);
      _validateLevel = _levelErrorText != null;
    });
    widget.onValidate(); // Notify parent that validation occurred
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _pokemonName,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
            LengthLimitingTextInputFormatter(50)
          ],
          style: TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            errorText: _validateName ? 'Pokemon name is required' : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            fillColor: Colors.black,
            filled: true,
            hintText: "Pokemon Name",
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          )

        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: Colors.black,
                    value: 'Normal',
                    icon: Icon(Icons.arrow_drop_down, color: Colors.red),
                    items: widget.items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: _pokemonLevel,
                style: TextStyle(color: Colors.white, fontSize: 16),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  errorText: _validateLevel ? _levelErrorText : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  fillColor: Colors.black,
                  filled: true,
                  hintText: "Pokemon Name",
                  hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                )

              ),
            ),
          ],
        ),
      ],
    );
  }
}

