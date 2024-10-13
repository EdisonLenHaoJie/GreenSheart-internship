import 'medication.dart';

class MedicationManager {
  // Private list to store medications
  final List<Medication> _medications = [];

  // Add a new medication
  void addMedication(Medication medication) {
    _medications.add(medication);
  }

  // Remove a medication by ID
  void removeMedication(int id) {
    _medications.removeWhere((med) => med.id == id);
  }

  // Update medication information
  void updateMedication(Medication updatedMedication) {
    for (int i = 0; i < _medications.length; i++) {
      if (_medications[i].id == updatedMedication.id) {
        _medications[i] = updatedMedication;
        break;
      }
    }
  }

  // Get a list of all medications
  List<Medication> getAllMedications() {
    return List.unmodifiable(_medications);
  }

  // Get a medication by ID
  Medication? getMedicationById(int id) {
    for (var med in _medications) {
    if (med.id == id) {
      return med;
    }
  }
  return null; // Returns null if no medication is found
  }
}