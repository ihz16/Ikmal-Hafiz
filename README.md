# Muhammad Ikmal Hafiz B. Jauffery
# 2016329
Assignment 1: Simple Profile Page

The code I make is a complete implementation of a simple profile page in Flutter. Here's a breakdown of what was done:

State Management: Utilized setState to manage the state within the ProfilePage StatefulWidget. State changes trigger a rebuild of the UI, allowing for dynamic updates based on user input.

Controller Disposal: Incorporated the dispose method to ensure proper disposal of TextEditingController instances, preventing memory leaks when the widget is disposed of.

Image Selection: Implemented _pickImage method using ImagePicker to allow users to select an image from their device's gallery. The selected image is displayed using the Image.file widget or a placeholder if no image is selected.

Profile Submission: Implemented _submitProfile method to capture and store the entered name and age when the "Submit" button is pressed. This triggers a state update, displaying the entered details below the button.

Conditional Display: Utilized conditional rendering to display the entered name, age, and profile picture only after submission.

UI Structure: Structured the UI using a Scaffold widget with an AppBar, Column, and various widgets like TextField, ElevatedButton, Image, and Placeholder organized in a vertical layout.

Overall, the code ensures a user-friendly interface where users can input their details, upload a profile picture, and view their entered information efficently on the same screen after submission. The UI design promotes a simple and clear user experience.
