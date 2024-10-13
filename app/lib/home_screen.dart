import 'package:flutter/material.dart';
import 'models/medication_manager.dart';
import 'models/medication.dart';
import 'models/prescription_medication.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MedicationManager _medicationManager = MedicationManager();

  @override
  void initState() {
    super.initState();
    // Initialize with some medications
    _initializeMedications();
  }

  void _initializeMedications() {
    // Adding some regular medications
    _medicationManager.addMedication(
      Medication(
        id: 1,
        name: 'Aspirin',
        time: DateTime.now(),
        dose: '100 mg',
      ),
    );
    _medicationManager.addMedication(
      Medication(
        id: 2,
        name: 'Ibuprofen',
        time: DateTime.now(),
        dose: '200 mg',
      ),
    );
    // Adding a prescription medication
    _medicationManager.addMedication(
      PrescriptionMedication(
        id: 3,
        name: 'Amoxicillin',
        time: DateTime.now(),
        dose: '500 mg',
        doctorName: 'Dr. Smith',
        frequency: 'once a day ',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Medication> medications = _medicationManager.getAllMedications();

    return Scaffold(
      appBar: AppBar(
        title: Text('Medications'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          Medication med = medications[index];
          return ListTile(
            title: Text(med.name),
            subtitle: Text('Dose: ${med.dose}'),
            trailing: Text(
                'Time: ${med.time.hour}:${med.time.minute.toString().padLeft(2, '0')}'),
            onTap: () {
              // Provide feedback to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${med.name}')),
              );
              // Display medication details
              _showMedicationDetails(med);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewMedication,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNewMedication() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: AddMedicationForm(
          onAdd: (Medication medication) {
            setState(() {
              _medicationManager.addMedication(medication);
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _showMedicationDetails(Medication med) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(med.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dose: ${med.dose}'),
              Text(
                  'Time: ${med.time.hour}:${med.time.minute.toString().padLeft(2, '0')}'),
              if (med is PrescriptionMedication) ...[
                Text('Doctor: ${med.doctorName}'),
                Text('Frequency : ${med.frequency}'),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Remove medication
                setState(() {
                  _medicationManager.removeMedication(med.id);
                });
                Navigator.pop(context);
              },
              child: Text('Remove'),
            ),
            TextButton(
              onPressed: () {
                // Close dialog
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
} 


class AddMedicationForm extends StatefulWidget {
  final Function(Medication) onAdd;

  AddMedicationForm({required this.onAdd});

  @override
  _AddMedicationFormState createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _dose = '';
  String _doctorName = '';
  String _frequency = '';
  bool _isPrescription = false;
 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Add New Medication',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Is this a prescription medication?'),
              value: _isPrescription,
              onChanged: (value) {
                setState(() {
                  _isPrescription = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Medication Name'),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter the medication name';
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dose'),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter the dose';
                return null;
              },
              onSaved: (value) {
                _dose = value!;
              },
            ),
            if (_isPrescription) ...[
              TextFormField(
                decoration: InputDecoration(labelText: 'Doctor Name'),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter the doctor\'s name';
                  return null;
                },
                onSaved: (value) {
                  _doctorName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Frequency'),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter the frequency (e.g., once a day)';
                  return null;
                },
                onSaved: (value) {
                  _frequency = value!;
                },
              ),
            ],
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                 backgroundColor: const Color.fromARGB(255, 136, 194, 235)
                            ),
              child: Text('Add Medication'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      
      _formKey.currentState!.save();

      int newId = DateTime.now().millisecondsSinceEpoch;

      Medication newMedication;
      if (_isPrescription) {
        newMedication = PrescriptionMedication(
          id: newId,
          name: _name,
          dose: _dose,
          time: DateTime.now(),
          doctorName: _doctorName,
          frequency: _frequency,
        );
      } else {
        newMedication = Medication(
          id: newId,
          name: _name,
          dose: _dose,
          time: DateTime.now(),
        );
      }

      widget.onAdd(newMedication);
    }
  }
}

