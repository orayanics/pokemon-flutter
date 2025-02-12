import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPokemon extends StatelessWidget{
   RegisterPokemon({super.key});

  final String dropdownValue = 'Normal';

  final List<String> items = [
    'Normal',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Ice',
    'Fighting',
    'Poison',
    'Ground',
    'Flying',
    'Psychic',
    'Bug',
    'Rock',
    'Ghost',
    'Dark',
    'Dragon',
    'Steel',
    'Fairy'
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Register Pokemon",
      home: Scaffold (
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pokemon Registration"),
        ),
        body: SingleChildScrollView(
          child:Column(
            children: [
          ImgSection(),
              InptFieldSection(items: items),
              PokeList(),

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
      padding: EdgeInsets.all(30),
      child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              // navigate back
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: Text('Back'),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              // navigate back
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: Text('Submit'),
          )
        ],
      ),
          )
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

class InptFieldSection extends StatelessWidget {
  final List<String> items;

  const InptFieldSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Pokemon Name",
                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 'Normal',
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle change
                    },
                  ),
                ),
              ),
    SizedBox(width: 20),
    Expanded(child: TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: "Level",
    hintMaxLines: 2,
    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)
    ),
    )
    )
            ],
          ),

        ],
      ),
    );
  }
}