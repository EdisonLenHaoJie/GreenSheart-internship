class Medication {
  // Properties
  final int id;
  String name;
  DateTime time;
  String dose;

  // Constructor
  Medication({
    required this.id,
    required this.name,
    required this.time,
    required this.dose,
  });

  // Method to display medication info (optional)
  void displayInfo() {
    print('Medication ID: $id');
    print('Name: $name');
    print('Time: $time');
    print('Dose: $dose');
  }
}