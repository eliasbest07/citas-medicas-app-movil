import 'dart:convert';
import 'package:citas_medicas_app_movil/modelos/medico.dart';
import 'package:citas_medicas_app_movil/vistas/lista_medicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

import '../modelos/consultorio.dart';
import '../modelos/especialidad.dart';

// Main screen to add a doctor
class AddMedicoScreen extends StatefulWidget {
  @override
  _AddMedicoScreenState createState() => _AddMedicoScreenState();
}

class _AddMedicoScreenState extends State<AddMedicoScreen> {
    final _formKey = GlobalKey<FormState>();
  late int _idPersona;
  late String _numeroColegioMedicos;
  int? _selectedEspecialidadId;
  int? _selectedConsultorioId;
  List<Especialidad> _especialidades = [];
  List<Consultorio> _consultorios = [];

  @override
  void initState() {
    super.initState();
    loadEspecialidades().then((value) {
      setState(() {
        _especialidades = value;
      });
    });
    loadConsultorios().then((value) {
      setState(() {
        _consultorios = value;
      });
    });
  }

  Future<List<Especialidad>> loadEspecialidades() async {
    final String response = await rootBundle.loadString('especialidades.json');
    final List<dynamic> data = json.decode(response);
    
    return data.map((json) => Especialidad.fromJson(json)).toList();
  }

  Future<List<Consultorio>> loadConsultorios() async {
    final String response = await rootBundle.loadString('consultorios.json');
    final List<dynamic> data = json.decode(response);
    
    return data.map((json) => Consultorio.fromJson(json)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Médico'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              // Handle menu option selection
              switch (value) {
                case 'Option 1':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListMedicosScreen(),));
                  break;
                case 'Option 2':
                  // Do something for Option 2
                  break;
                case 'Option 3':
                  // Do something for Option 3
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Row(
                    children: [
                      Icon(Icons.list_alt_rounded),
                      SizedBox(width: 10,),
                      Text('Ver todos'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10,),
                      Text('Buscar'),
                    ],
                  ),
                ),
               const  PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Row(
                    children: [
                      Icon(Icons.checklist_rtl_sharp),
                      SizedBox(width: 10,),
                      Text('Inhabilitar'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(labelText: 'ID Persona'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _idPersona = int.tryParse(value ?? '') ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el ID de la persona';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: DropdownButton<int>(
                    value: _selectedEspecialidadId,
                    hint: Text('Seleccione Especialidad'),
                    items: _especialidades.map((especialidad) {
                      return DropdownMenuItem<int>(
                        value: especialidad.idEspecialidad,
                        child: Text(especialidad.nombre),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedEspecialidadId = value;
                      });
                    },
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número de Colegio de Médicos'),
                onSaved: (value) {
                  _numeroColegioMedicos = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de colegio de médicos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: DropdownButton<int>(
                    value: _selectedConsultorioId,
                    hint: Text('Seleccione Consultorio'),
                    items: _consultorios.map((consultorio) {
                      return DropdownMenuItem<int>(
                        value: consultorio.idConsultorio,
                        child: Text(consultorio.nombre),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedConsultorioId = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Simulate saving the doctor (e.g., make an API call)
                    Navigator.pop(context, Medico(
                      idPersona: _idPersona,
                      idEspecialidad: _selectedEspecialidadId!,
                      numeroColegioMedicos: _numeroColegioMedicos,
                      idConsultorio: _selectedConsultorioId!,
                    ));
                  }
                },
                child: const Text('Agregar Médico'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}