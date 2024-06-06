import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _firstName = '';
  String _lastName = '';
  DateTime? _selectedDate;
  String _email = '';
  String _selectedCountry = 'United States';
  String _phoneNumber = '';
  String _selectedGender = 'Male';

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/profile');
          },
        ),
        title: Text(
          "Edit Profile Screen",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // Handle tap
                },
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: GoogleFonts.poppins(),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  // Handle tap
                },
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: GoogleFonts.poppins(),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      labelStyle: GoogleFonts.poppins(),
                      suffixIcon: Icon(Icons.calendar_today),
                      border: InputBorder.none,
                    ),
                    controller: TextEditingController(
                      text: _selectedDate != null
                          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                          : '',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle tap
                      },
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(),
                          suffixIcon:
                              Icon(Icons.mail_outline, color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value!;
                  });
                },
                items: ['United States', 'Turkey']
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: GoogleFonts.poppins(),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  DropdownButton<String>(
                    value: '+1',
                    onChanged: (value) {
                      setState(() {
                        // Country code selection logic
                      });
                    },
                    items: ['+1', '+90']
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle tap
                      },
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: GoogleFonts.poppins(),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _phoneNumber = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                items: ['Male', 'Female']
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: GoogleFonts.poppins(),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: InkWell(
                  onTap: () {
                    // Handle tap
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle form submission
                      },
                      child: Text('Update'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        foregroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.black
                                : Colors.white,
                        textStyle: GoogleFonts.poppins(color: Colors.black),
                        // Customize the button color here
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(selectedIndex: 4),
    );
  }
}
