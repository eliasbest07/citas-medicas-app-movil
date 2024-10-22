import 'package:flutter/material.dart';

class HistorialMedica extends StatefulWidget {
  const HistorialMedica({super.key});

  @override
  HistorialMedicaState createState() => HistorialMedicaState();
}

class HistorialMedicaState extends State<HistorialMedica> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientIdController = TextEditingController();
  TextEditingController medicalNotesController = TextEditingController();
  TextEditingController appointmentDateController = TextEditingController();

  String? selectedDoctor;
  String? selectedSpeciality;

  // Sample data for doctors and specialities (simulating API data)
  List<String> doctors = ['Dr. John Doe', 'Dr. Jane Smith', 'Dr. Carlos Martinez'];
  List<String> specialities = ['Cardiology', 'Neurology', 'Orthopedics'];

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
   patientNameController.dispose();
    patientIdController.dispose();
    medicalNotesController.dispose();
    appointmentDateController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate API request data
      final data = {
        'patient': {
          'id': patientIdController.text,
          'name':  patientNameController.text,
        },
        'doctor': selectedDoctor,
        'speciality': selectedSpeciality,
        'appointmentDate': appointmentDateController.text,
        'medicalNotes': medicalNotesController.text,
      };

      // Print data to console for debugging
      print('Data to send: $data');

      // Here, you would typically send the data to an API
      // Example:
      // sendDataToApi(data);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Historial Medica agregada correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Historial Medica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: patientIdController,
                  decoration: const InputDecoration(labelText: 'Patient ID'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a patient ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller:  patientNameController,
                  decoration: InputDecoration(labelText: 'Patient Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the patient\'s name';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedDoctor,
                  hint: const Text('Eligue el Medico'),
                  onChanged: (value) {
                    setState(() {
                      selectedDoctor = value;
                    });
                  },
                  items: doctors.map((doctor) {
                    return DropdownMenuItem(
                      value: doctor,
                      child: Text(doctor),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes selecionar un Medico';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedSpeciality,
                  hint: Text('Eligue la especialidad'),
                  onChanged: (value) {
                    setState(() {
                      selectedSpeciality = value;
                    });
                  },
                  items: specialities.map((speciality) {
                    return DropdownMenuItem(
                      value: speciality,
                      child: Text(speciality),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a speciality';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: appointmentDateController,
                  decoration: InputDecoration(
                    labelText: 'Appointment Date',
                    hintText: 'yyyy-mm-dd',
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the appointment date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: medicalNotesController,
                  decoration: InputDecoration(labelText: 'Medical Notes'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide some medical notes';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}