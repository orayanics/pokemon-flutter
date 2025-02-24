class FieldValidators {
  static String? validatePokemon(String name, {bool notFound = false}) {
    if (name.isEmpty) {
      return "Pokémon name cannot be empty.";
    } else if (!RegExp(r"^[a-zA-Z0-9-]+$").hasMatch(name)) {
      return "Invalid Pokémon name format.";
    }
    return null; // No errors
  }
}
