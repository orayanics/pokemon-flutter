// lib/validators/pokemon_register_validator.dart
import 'package:flutter/material.dart';

class FieldValidators {
  static String? validatePokemonName(String value) {
    if (value.isEmpty) {
      return 'Pokémon Name is required';
    }
    return null;
  }

  static String? validatePokemonType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pokémon Type is required';
    }
    return null;
  }

  static String? validatePokemonLevel(String value) {
    if (value.isEmpty) {
      return 'Level is required';
    } else if (int.tryParse(value) == null) {
      return 'Level must be a number';
    } else if (int.parse(value) < 1 || int.parse(value) > 100) {
      return 'Level must be between 1 and 100';
    }
    return null;
  }
}
