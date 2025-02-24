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

  static String? validateTrainerType(String value){
    if(value.isEmpty){
      return 'Trainer Type is required';
    }
    return null;
  }

  static String? validateTrainerID(String value){
    if(value.isEmpty){
      return 'Trainer ID is required';
    }
    return null;
  }

 static String? validateTrainerEmail(String value) {
      if (value.isEmpty) {
        return 'Trainer Email is required';
      }
      // Regular expression for validating an email
      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
      return null;
    }

    static String? validateContact(String value) {
        if (value.isEmpty) {
          return 'Contact is required';
        }
        // Regular expression for validating an 11-digit Philippine number
        String pattern = r'^(09|\+639)\d{9}$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return 'Enter a valid 11-digit Philippine number';
        }
        return null;
      }
}