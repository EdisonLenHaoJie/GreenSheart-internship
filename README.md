<h1>Design Choices</h1>

<h2>1. Object-Oriented Programming (OOP)</h2>

<ul>
  <li>
    <strong>Medication Class Hierarchy</strong>: A base <code>Medication</code> class represents general medications, with a subclass <code>PrescriptionMedication</code> for medications that require a prescription. This demonstrates <strong>inheritance</strong> and <strong>polymorphism</strong>, allowing for code reuse and scalability.
  </li>
  <li>
    <strong>MedicationManager</strong>: Implemented a <code>MedicationManager</code> class to handle all medication-related operations such as adding, removing, and updating medications. This encapsulates the medication logic and maintains a <strong>clean separation of concerns</strong>.
  </li>
</ul>

<h2>2. State Management</h2>

<ul>
  <li>
    <strong>Stateful Widgets</strong>: Used <code>StatefulWidget</code> for screens that require dynamic updates, like the login screen and home screen.
  </li>
  <li>
    <strong>setState</strong>: Managed state using <code>setState</code> for simplicity and to reflect changes in the UI immediately.
  </li>
</ul>

<h2>3. User Interface</h2>

<ul>
  <li>
    <strong>Consistent Design</strong>: Maintained a consistent color scheme and styling across all screens to enhance user experience.
  </li>
  <li>
    <strong>Responsive UI</strong>: Built the UI using Flutter widgets that adapt to different screen sizes, ensuring the app looks good on various devices.
  </li>
  <li>
    <strong>Background Images</strong>: Used <code>Stack</code> to layer widgets and display background images without interfering with the interactive elements.
  </li>
</ul>

<h2>4. Form Validation</h2>

<ul>
  <li>
    <strong>Login Screen Validation</strong>: Implemented validation to ensure users enter a valid email and a password that is at least six characters long. This prevents invalid data from being processed.
  </li>
  <li>
    <strong>Add Medication Form Validation</strong>: Ensured all required fields are filled out before allowing the user to add a new medication. Provided clear error messages to guide the user.
  </li>
</ul>

<h2>5. Code Organization</h2>

<ul>
  <li>
    <strong>File Structure</strong>: Organized code into separate files for each screen (<code>login_screen.dart</code>, <code>home_screen.dart</code>) and model classes (<code>medication.dart</code>, <code>prescription_medication.dart</code>, <code>medication_manager.dart</code>). This improves maintainability and readability.
  </li>
  <li>
    <strong>Best Practices</strong>: Followed Dart and Flutter best practices, including proper naming conventions, use of <code>const</code> and <code>final</code>, and widget composition.
  </li>
</ul>

<h1>Assumptions</h1>

<ul>
  <li>
    <strong>No Persistent Storage</strong>: The app does not implement long-term data persistence. All medication data is stored in memory and will be lost when the app is closed. This aligns with the project requirements that specify long-term persistence is not required.
  </li>
  <li>
    <strong>User Authentication</strong>: The login functionality does not include actual authentication against a user database. It assumes that any input that passes validation is acceptable for logging in.
  </li>
  <li>
    <strong>Time Handling</strong>: Medications are assigned the current time when added. Time selection for medications is not implemented but could be added in future iterations.
  </li>
  <li>
    <strong>Error Handling</strong>: Assumes that all operations succeed and does not include extensive error handling for unexpected exceptions, given the project's scope.
  </li>
</ul>

