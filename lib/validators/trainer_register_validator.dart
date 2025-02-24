// lib/validators/field_validators.dart
import 'package:flutter/material.dart';

class FieldValidators {
  static String? validateTrainerName(String value) {
    if (value.isEmpty) {
      return 'Trainer Name is required';
    }
    return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty) {
      return 'Age is required';
    } else if (int.tryParse(value) == null) {
      return 'Age must be a number';
    } else if (int.parse(value) < 10) {
      return 'Age must be at least 10';
    }
    return null;
  }

  static String? validateHome(String value){
    if(value.isEmpty){
      return 'Home Town is required';
    }
    return null;
  }

  static String? validateGender(String value){
    if(value.isEmpty){
      return 'Gender is required';
    }
    return null;
  }
}