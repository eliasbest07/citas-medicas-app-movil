class HistorialMedica {
  int idPaciente;
  String descripcion;
  DateTime fecha;

  // Constructor
  HistorialMedica({
    required this.idPaciente,
    required this.descripcion,
    required this.fecha,
  });

  // Factory method to create an instance from a JSON object
  factory HistorialMedica.fromJson(Map<String, dynamic> json) {
    return HistorialMedica(
      idPaciente: json['idPaciente'],
      descripcion: json['descripcion'],
      fecha: DateTime.parse(json['fecha']),
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'idPaciente': idPaciente,
      'descripcion': descripcion,
      'fecha': fecha.toIso8601String(),
    };
  }

  // Optional: Method to print the instance for debugging
  @override
  String toString() {
    return 'HistorialMedica(idPaciente: $idPaciente, descripcion: $descripcion, fecha: $fecha)';
  }
}