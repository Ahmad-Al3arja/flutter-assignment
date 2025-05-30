import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the arguments passed from the previous screen
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String? username = arguments['username'];
    final String? password = arguments['password'];
    final String? email = arguments['email'];
    final bool? rememberMe = arguments['rememberMe'];
    final String? gender = arguments['gender'];
    final String? country = arguments['country'];
    final double? age = arguments['age'];
    final DateTime? selectedDate = arguments['selectedDate'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Output'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Form Data Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDataRow('Username', username ?? 'Not provided'),
                    _buildDataRow(
                      'Password',
                      password != null ? '*' * password.length : 'Not provided',
                    ),
                    _buildDataRow('Email', email ?? 'Not provided'),
                    _buildDataRow(
                      'Remember Me',
                      rememberMe == true ? 'Yes' : 'No',
                    ),
                    _buildDataRow(
                      'Gender',
                      gender?.toUpperCase() ?? 'Not selected',
                    ),
                    _buildDataRow('Country', country ?? 'Not selected'),
                    _buildDataRow(
                      'Age',
                      age != null ? '${age.round()} years' : 'Not set',
                    ),
                    _buildDataRow(
                      'Selected Date',
                      selectedDate != null
                          ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                          : 'Not selected',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the form screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Go Back'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Reset Form'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
