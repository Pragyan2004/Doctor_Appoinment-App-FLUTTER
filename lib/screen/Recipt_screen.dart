import 'package:flutter/material.dart';
import 'package:practice/utils/config.dart'; // Assuming you have this utils file for colors and styling

class ReceiptScreen extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String appointmentDate;
  final String appointmentTime;

  const ReceiptScreen({
    Key? key,
    required this.doctorName,
    required this.speciality,
    required this.appointmentDate,
    required this.appointmentTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Receipt'),
        backgroundColor: Config.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thank you for booking!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Doctor: $doctorName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Speciality: $speciality',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Date: $appointmentDate',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Time: $appointmentTime',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Estimated Waiting Time: 15 minutes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'Receipt',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text('Appointment Fee'),
              trailing: const Text('\$100'),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Consultation Fee'),
              trailing: const Text('\$50'),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Text(
                '\$150',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
