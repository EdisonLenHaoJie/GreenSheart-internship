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
        prescriptionNumber: 'RX123456',
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
            trailing: Text('Time: ${med.time.hour}:${med.time.minute.toString().padLeft(2, '0')}'),
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
    // Logic to add a new medication (you can implement a form)
    // For demonstration, we'll add a dummy medication
    setState(() {
      int newId = _medicationManager.getAllMedications().length + 1;
      _medicationManager.addMedication(
        Medication(
          id: newId,
          name: 'New Medication $newId',
          time: DateTime.now(),
          dose: '150 mg',
        ),
      );
    });
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
              Text('Time: ${med.time.hour}:${med.time.minute.toString().padLeft(2, '0')}'),
              if (med is PrescriptionMedication) ...[
                Text('Doctor: ${med.doctorName}'),
                Text('Prescription #: ${med.prescriptionNumber}'),
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