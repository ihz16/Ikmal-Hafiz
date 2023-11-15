import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  File? _image;
  String? _name;
  int? _age;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  void _submitProfile() {
    setState(() {
      _name = _nameController.text;
      _age = int.tryParse(_ageController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Profile Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your age'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Upload Profile Picture'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitProfile,
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            _name != null && _age != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: $_name'),
                      Text('Age: $_age'),
                      SizedBox(height: 20.0),
                      _image != null
                          ? Image.file(
                              _image!,
                              height: 200.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Placeholder(
                              fallbackHeight: 200.0,
                              fallbackWidth: double.infinity,
                            ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

