import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modelos/medico.dart';

class ListMedicosScreen extends StatefulWidget {
  const ListMedicosScreen({super.key});

  @override
  ListMedicosScreenState createState() => ListMedicosScreenState();
}

class ListMedicosScreenState extends State<ListMedicosScreen> {
  List<Medico> _medicos = [];

  @override
  void initState() {
    super.initState();
    loadMedicos();
  }

  Future<void> loadMedicos() async {
    final String response = await rootBundle.loadString('medicos.json');
    final List<dynamic> data = json.decode(response);
    
    setState(() {
      _medicos = data.map((json) => Medico.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Médicos'),
      ),
      body: _medicos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _medicos.length,
              itemBuilder: (context, index) {
                final medico = _medicos[index];
                return Dismissible(
                  key: Key(medico.idPersona.toString()),
                  background: Container(color: Colors.red, alignment: Alignment.centerLeft, child: Icon(Icons.delete, color: Colors.white)),
                  secondaryBackground: Container(color: Colors.blue, alignment: Alignment.centerRight, child: Icon(Icons.edit, color: Colors.white)),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      // Edit action
                      // Navigate to edit screen, pass the selected medico
                      // For example:
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => EditMedicoScreen(medico: medico),
                      // ));
                      return false; // Prevent dismiss
                    } else {
                      // Delete action
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirmar eliminación'),
                          content: Text('¿Estás seguro de que deseas eliminar a este médico?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Remove medico from the list
                                setState(() {
                                  _medicos.removeAt(index);
                                });
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Eliminar'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: ListTile(
                    title: Text('Médico ID: ${medico.idPersona}'),
                    subtitle: Text('Especialidad ID: ${medico.idEspecialidad}\nNúmero de Colegio: ${medico.numeroColegioMedicos}\nConsultorio ID: ${medico.idConsultorio}'),
                  ),
                );
              },
            ),
    );
  }
}