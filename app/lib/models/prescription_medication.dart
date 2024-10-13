import 'medication.dart';

class PrescriptionMedication extends Medication {
  // Additional properties
  String doctorName;
  String frequency;

  // Constructor
  PrescriptionMedication({
    required int id,
    required String name,
    required DateTime time,
    required String dose,
    required this.doctorName,
    required this.frequency,
  }) : super(
          id: id,
          name: name,
          time: time,
          dose: dose,
        );

  // Override displayInfo method (polymorphism)
  @override
  void displayInfo() {
    super.displayInfo();
    print('Doctor Name: $doctorName');
    print('Frequency: $frequency');
  }
}
