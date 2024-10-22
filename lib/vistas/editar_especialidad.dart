import 'package:citas_medicas_app_movil/modelos/especialidad.dart';
import 'package:flutter/material.dart';

class EditEspecialidadScreen extends StatefulWidget {
  final Especialidad especialidad;

  const EditEspecialidadScreen({super.key, required this.especialidad});

  @override
  EditEspecialidadScreenState createState() => EditEspecialidadScreenState();
}

class EditEspecialidadScreenState extends State<EditEspecialidadScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nombre;
  late bool _esActivo;
  late int _tiempoConsulta;

  @override
  void initState() {
    super.initState();
    // Initialize fields with existing data
    _nombre = widget.especialidad.nombre;
    _esActivo = widget.especialidad.esActivo;
    _tiempoConsulta = widget.especialidad.tiempoConsulta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Especialidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                onSaved: (value) {
                  _nombre = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la especialidad';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('¿Está activa?'),
                value: _esActivo,
                onChanged: (value) {
                  setState(() {
                    _esActivo = value;
                  });
                },
              ),
              TextFormField(
                initialValue: _tiempoConsulta.toString(),
                decoration: const InputDecoration(labelText: 'Tiempo de consulta (min)'),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Update the especialidad here (e.g., make an API call)
                    Navigator.pop(context, Especialidad(
                      idEspecialidad: widget.especialidad.idEspecialidad,
                      nombre: _nombre,
                      esActivo: _esActivo,
                      tiempoConsulta: _tiempoConsulta,
                    ));
                  }
                },
                child: const Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}