import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPokemon extends StatelessWidget {
  RegisterPokemon({super.key});

  final List<String> items = [
    'Normal', 'Fire', 'Water', 'Grass', 'Electric', 'Ice', 'Fighting',
    'Poison', 'Ground', 'Flying', 'Psychic', 'Bug', 'Rock', 'Ghost',
    'Dark', 'Dragon', 'Steel', 'Fairy'
  ];

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
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset("assets/logo.png", width: 25, height: 25),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
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
                  InptFieldSection(items: items),
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
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    label: Text('Back'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[900],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
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

class InptFieldSection extends StatelessWidget {
  final List<String> items;
  const InptFieldSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.white,
            filled: true,
            hintText: "Pokemon Name",
            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 'Normal',
                    icon: Icon(Icons.arrow_drop_down, color: Colors.red),
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Level",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
