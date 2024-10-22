class Consultorio {
  int idConsultorio;
  String nombre;
  String direccion;
  String telefono;
  bool esActivo;

  Consultorio({
    required this.idConsultorio,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.esActivo,
  });

  factory Consultorio.fromJson(Map<String, dynamic> json) {
    return Consultorio(
      idConsultorio: json['idConsultorio'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      esActivo: json['esActivo'],
    );
  }
}