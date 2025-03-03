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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              GymBadgesSection(),
              SizedBox(height: 30),
              HallOfFameSection(),
              SizedBox(height: 30),
              BackButtonSection(),
            ],
          ),
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
      'Celadon': 'assets/badges/celadon_badge.png',
      'Fuchsia': 'assets/badges/fuchsia_badge.png',
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red[900]!, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Gym Badges', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: badgeImages.entries.map((entry) => Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                      entry.value,
                      fit: BoxFit.cover
                  ),
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('${entry.key} Badge'),
                ),
              ],
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class HallOfFameSection extends StatelessWidget {
  const HallOfFameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mvpPokemons = {
      'Pewter': 'Onix - Rock/Ground | Moves: Rock Throw, Bind | Trainer: Brock',
      'Cerulean': 'Starmie - Water/Psychic | Moves: Bubble Beam, Recover | Trainer: Misty',
      'Vermilion': 'Raichu - Electric | Moves: Thunderbolt, Quick Attack | Trainer: Lt. Surge',
      'Celadon': 'Vileplume - Grass/Poison | Moves: Petal Dance, Stun Spore | Trainer: Erika',
      'Fuchsia': 'Weezing - Poison | Moves: Sludge, Explosion | Trainer: Koga',
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red[900]!, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Pokémon Hall of Fame', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mvpPokemons.length,
            itemBuilder: (context, index) {
              final entry = mvpPokemons.entries.elementAt(index);
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text('${entry.key} Gym Most Valuable Pokemon', style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(entry.value),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BackButtonSection extends StatelessWidget {
  const BackButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: ElevatedButton(
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back, color: Colors.white),
              const SizedBox(width: 5),
              const Text('Back'),
            ],
          ),
        ),
      ),
    );
  }
}
