import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class Especialidad {
  int idEspecialidad;
  String nombre;
  bool esActivo;
  int tiempoConsulta;

  Especialidad({
    required this.idEspecialidad,
    required this.nombre,
    required this.esActivo,
    required this.tiempoConsulta,
  });

  // Method to create an instance from a JSON object
  factory Especialidad.fromJson(Map<String, dynamic> json) {
    return Especialidad(
      idEspecialidad: json['idEspecialidad'],
      nombre: json['nombre'],
      esActivo: json['esActivo'],
      tiempoConsulta: json['tiempoConsulta'],
    );
  }
}