import 'package:citas_medicas_app_movil/vistas/lista_especialidades.dart';
import 'package:flutter/material.dart';

class AddEspecialidadScreen extends StatefulWidget {
  const AddEspecialidadScreen({super.key});

  @override
  _AddEspecialidadScreenState createState() => _AddEspecialidadScreenState();
}

class _AddEspecialidadScreenState extends State<AddEspecialidadScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _idEspecialidad;
  String _nombre = '';
  bool _esActivo = true;
  int _tiempoConsulta = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Especialidad'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              // Handle menu option selection
              switch (value) {
                case 'Option 1':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EspecialidadesListScreen(),));
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
                      Text('Ver todas'),
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
                      Text('Desactivar'),
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
          child: ListView(
            children: [
              // ID Especialidad
              TextFormField(
                enabled: false,
                decoration: const  InputDecoration(
                  labelText: 'ID Especialidad',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _idEspecialidad = int.tryParse(value ?? '');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el ID de la Especialidad';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Nombre
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _nombre = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la Especialidad';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Tiempo de Consulta
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tiempo de Consulta (minutos)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _tiempoConsulta = int.tryParse(value ?? '') ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el tiempo de consulta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Es Activo
              SwitchListTile(
                title: Text('Activo'),
                value: _esActivo,
                onChanged: (value) {
                  setState(() {
                    _esActivo = value;
                  });
                },
              ),
              SizedBox(height: 16.0),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Guardar Especialidad'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Create Especialidad instance
      Especialidad newEspecialidad = Especialidad(
        idEspecialidad: _idEspecialidad!,
        nombre: _nombre,
        esActivo: _esActivo,
        tiempoConsulta: _tiempoConsulta,
      );

      // Simulate sending data to an API
      print('Especialidad Guardada: ${newEspecialidad.toJson()}');

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Especialidad guardada con éxito')),
      );

      // Optionally, you could navigate back or clear the form
    }
  }
}

// Assuming the Especialidad class is defined as follows:
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

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'idEspecialidad': idEspecialidad,
      'nombre': nombre,
      'esActivo': esActivo,
      'tiempoConsulta': tiempoConsulta,
    };
  }
}