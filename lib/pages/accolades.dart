import 'package:flutter/material.dart';
import 'package:activity_flutter/main.dart';

class Accolades extends StatelessWidget {
  const Accolades({super.key});

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
        centerTitle: true,
        title: const Text("Trainer Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [DrwHeader(), DrwListView()],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            GymBadgesSection(),
            HallOfFameSection(),
            BackButtonSection(),
          ],
        ),
      ),
    );
  }
}

class GymBadgesSection extends StatelessWidget {
  const GymBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final badgeImages = {
      'Pewter': 'assets/badges/pewter_badge.png',
      'Cerulean': 'assets/badges/cerulean_badge.png',
      'Vermilion': 'assets/badges/vermilion_badge.png',
      'Celadon': 'assets/badges/celadon_badge.jpg',
      'Fuchsia': 'assets/badges/fuchsia_badge.png',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gym Badges', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: badgeImages.entries.map((entry) => Column(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  entry.value,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('No Image')),
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {},
                child: Text('${entry.key} Badge'),
              ),
            ],
          )).toList(),
        ),
      ],
    );
  }
}

class HallOfFameSection extends StatelessWidget {
  const HallOfFameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mvpPokemons = {
      'Pewter': 'Onix - Rock/Ground | MVP of Pewter Gym',
      'Cerulean': 'Starmie - Water/Psychic | MVP of Cerulean Gym',
      'Vermilion': 'Raichu - Electric | MVP of Vermilion Gym',
      'Celadon': 'Vileplume - Grass/Poison | MVP of Celadon Gym',
      'Fuchsia': 'Weezing - Poison | MVP of Fuchsia Gym',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pokémon Hall of Fame', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: mvpPokemons.length,
          itemBuilder: (context, index) {
            final entry = mvpPokemons.entries.elementAt(index);
            return Card(
              child: ListTile(
                title: Text('${entry.key} Gym MVP'),
                subtitle: Text(entry.value),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BackButtonSection extends StatelessWidget {
  const BackButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp())),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.red[900],
        ),
        child: const Text('Back'),
      ),
    );
  }
}