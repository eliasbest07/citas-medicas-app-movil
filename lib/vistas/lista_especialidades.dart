import 'dart:convert';
import 'package:citas_medicas_app_movil/modelos/especialidad.dart';
import 'package:citas_medicas_app_movil/vistas/editar_especialidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EspecialidadesListScreen extends StatefulWidget {
  const EspecialidadesListScreen({super.key});

  @override
  EspecialidadesListScreenState createState() => EspecialidadesListScreenState();
}

class EspecialidadesListScreenState extends State<EspecialidadesListScreen> {
  List<Especialidad> especialidades = [];

  @override
  void initState() {
    super.initState();
    _loadEspecialidades();
  }

  // Method to load specialties from a JSON file
  Future<void> _loadEspecialidades() async {
    final String response = await rootBundle.loadString('especialidades.json');
    final List<dynamic> jsonList = json.decode(response);
    setState(() {
      especialidades = jsonList.map((json) => Especialidad.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Especialidades'),
      ),
      body: ListView.builder(
        itemCount: especialidades.length,
        itemBuilder: (context, index) {
          final especialidad = especialidades[index];
          return Dismissible(
            key: Key(especialidad.idEspecialidad.toString()),
            background: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Confirm deletion
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmar eliminación'),
                    content: Text('¿Estás seguro de que deseas eliminar a ${especialidad.nombre}?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              }
              return true; // Allow editing
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                _editEspecialidad(especialidad);
              } else if (direction == DismissDirection.endToStart) {
                _deleteEspecialidad(especialidad);
              }
            },
            child: ListTile(
              title: Text(especialidad.nombre),
              subtitle: Text('Tiempo de consulta: ${especialidad.tiempoConsulta} min'),
              trailing: especialidad.esActivo 
                  ? const Icon(Icons.check, color: Colors.green) 
                  : const Icon(Icons.close, color: Colors.red),
            ),
          );
        },
      ),
    );
  }

  void _editEspecialidad(Especialidad especialidad) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEspecialidadScreen(especialidad: especialidad),
      ),
    );

    if (result != null) {
      setState(() {
        // Update the list with the edited especialidad
        final editedEspecialidad = result as Especialidad;
        especialidades[especialidades.indexWhere((e) => e.idEspecialidad == editedEspecialidad.idEspecialidad)] = editedEspecialidad;
      });
    }
  }

  void _deleteEspecialidad(Especialidad especialidad) {
    setState(() {
      especialidades.removeWhere((e) => e.idEspecialidad == especialidad.idEspecialidad);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${especialidad.nombre} eliminada')),
    );
  }
}