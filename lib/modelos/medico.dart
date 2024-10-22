class Medico {
  int idPersona;
  int idEspecialidad;
  String numeroColegioMedicos;
  int idConsultorio;

  Medico({required this.idPersona, required this.idEspecialidad, required this.numeroColegioMedicos, required this.idConsultorio});

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      idPersona: json['idPersona'],
      idEspecialidad: json['idEspecialidad'],
      numeroColegioMedicos: json['numeroColegioMedicos'],
      idConsultorio: json['idConsultorio'],
    );
  }
}