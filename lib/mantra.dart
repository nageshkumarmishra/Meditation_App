import 'package:flutter/material.dart';


class Mantra {
  String? title;
  String? sanskrit;
  String? transliteration;
  String? translation;

  Mantra({this.title, this.sanskrit, this.transliteration, this.translation});

  factory Mantra.fromJson(Map<String, dynamic> json) {
    return Mantra(
      title: json['title'],
      sanskrit: json['sanskrit'],
      transliteration: json['transliteration'],
      translation: json['translation'],
    );
  }
}