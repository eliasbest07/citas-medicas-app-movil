class UbicacionConsultorio {
  int idUbicacion;
  String nombre;
  String descripcion;
  bool esActivo;

  // Constructor
  UbicacionConsultorio({
    required this.idUbicacion,
    required this.nombre,
    required this.descripcion,
    required this.esActivo,
  });

  // Factory method to create an instance from a JSON object
  factory UbicacionConsultorio.fromJson(Map<String, dynamic> json) {
    return UbicacionConsultorio(
      idUbicacion: json['idUbicacion'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      esActivo: json['esActivo'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'idUbicacion': idUbicacion,
      'nombre': nombre,
      'descripcion': descripcion,
      'esActivo': esActivo,
    };
  }

  // Optional: Method to print the instance for debugging
  @override
  String toString() {
    return 'UbicacionConsultorio(idUbicacion: $idUbicacion, nombre: $nombre, descripcion: $descripcion, esActivo: $esActivo)';
  }
}