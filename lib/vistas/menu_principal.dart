import 'package:citas_medicas_app_movil/vistas/agregar_especialidad.dart';
import 'package:citas_medicas_app_movil/vistas/agregar_medico.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuItem(Icons.escalator_sharp, 'Agregar Especialidad',context, MaterialPageRoute(builder: (context) => const AddEspecialidadScreen(),)),
            _buildMenuItem(Icons.person, 'Agregar Medico',context,MaterialPageRoute(builder: (context) =>  AddMedicoScreen(),)),
            _buildMenuItem(Icons.local_hospital, 'Historial Medica Pacientes',context,MaterialPageRoute(builder: (context) => const AddEspecialidadScreen(),)),
            _buildMenuItem(Icons.medical_information, 'Consultas Medicas',context,MaterialPageRoute(builder: (context) => const AddEspecialidadScreen(),)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context, MaterialPageRoute route) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.grey),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}