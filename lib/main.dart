import 'package:activity_flutter/pages/accolades.dart';
import 'package:activity_flutter/pages/pokedex.dart';
import 'package:activity_flutter/pages/register_form.dart';
import 'package:activity_flutter/pages/register_pokemon.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PokeWorld",
      home: const Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset("assets/logo.png", width: 25, height: 25),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: HomeContent(),
      drawer: Drawer(
          child: ListView(
        children: [DrwHeader(), DrwListView()],
      )),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Animate(
          effects: [ScaleEffect()],
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                "assets/logoRed.png",
                width: 200,
                height: 200,
                opacity: const AlwaysStoppedAnimation(.5),
              ).animate().scale()),
        ),
        Text("PokéWorld",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.all(20), child: TextTyper()),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterForm()));
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              fixedSize: Size(200, 60),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Continue"),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class TextTyper extends StatefulWidget {
  @override
  _TextTyper createState() => _TextTyper();
}

class _TextTyper extends State<TextTyper> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('Welcome to the world of Pokemon!',
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          TyperAnimatedText('But first, tell us a little about yourself.',
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
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
