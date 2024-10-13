# Design Choices
1. Object-Oriented Programming (OOP)
Medication Class Hierarchy: A base Medication class represents general medications, with a subclass PrescriptionMedication for medications that require a prescription. This demonstrates inheritance and polymorphism, allowing for code reuse and scalability.

MedicationManager: Implemented a MedicationManager class to handle all medication-related operations such as adding, removing, and updating medications. This encapsulates the medication logic and maintains a clean separation of concerns.

2. State Management
Stateful Widgets: Used StatefulWidget for screens that require dynamic updates, like the login screen and home screen.

SetState: Managed state using setState for simplicity and to reflect changes in the UI immediately.

3. User Interface
Consistent Design: Maintained a consistent color scheme and styling across all screens to enhance user experience.

Responsive UI: Built the UI using Flutter widgets that adapt to different screen sizes, ensuring the app looks good on various devices.

Background Images: Used Stack to layer widgets and display background images without interfering with the interactive elements.

4. Form Validation
Login Screen Validation: Implemented validation to ensure users enter a valid email and a password that is at least six characters long. This prevents invalid data from being processed.

Add Medication Form Validation: Ensured all required fields are filled out before allowing the user to add a new medication. Provided clear error messages to guide the user.

5. Code Organization
File Structure: Organized code into separate files for each screen (login_screen.dart, home_screen.dart) and model classes (medication.dart, prescription_medication.dart, medication_manager.dart). This improves maintainability and readability.

Best Practices: Followed Dart and Flutter best practices, including proper naming conventions, use of const and final, and widget composition.

# Assumptions
No Persistent Storage: The app does not implement long-term data persistence. All medication data is stored in memory and will be lost when the app is closed. This aligns with the project requirements that specify long-term persistence is not required.

User Authentication: The login functionality does not include actual authentication against a user database. It assumes that any input that passes validation is acceptable for logging in.

Time Handling: Medications are assigned the current time when added. Time selection for medications is not implemented but could be added in future iterations.

Error Handling: Assumes that all operations succeed and does not include extensive error handling for unexpected exceptions, given the project's scope.
