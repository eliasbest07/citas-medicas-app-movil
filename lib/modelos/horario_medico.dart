class HorarioMedicoSemanal {
  int idMedico;
  int idHoraDia;
  int idDiaSemana;

  HorarioMedicoSemanal({required this.idMedico, required this.idHoraDia, required this.idDiaSemana});
}

class HoraDia {
  int idHora;
  String nombre;
  bool seLabora;

  HoraDia({required this.idHora, required this.nombre, required this.seLabora});
}

class DiaSemana {
  int idDiaSemana;
  String nombre;
  bool seLabora;

  DiaSemana({required this.idDiaSemana, required this.nombre, required this.seLabora});
}

class HorarioConsulta {
  int idHorarioConsulta;
  int idMedico;
  int idDia;
  int idHora;

  HorarioConsulta({required this.idHorarioConsulta, required this.idMedico, required this.idDia, required this.idHora});
}

class Calendario {
  int idDia;
  DateTime fecha;
  int idDiaSemana;

  Calendario({required this.idDia, required this.fecha, required this.idDiaSemana});
}