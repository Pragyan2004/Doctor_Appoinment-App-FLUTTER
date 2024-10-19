import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:practice/screen/Recipt_screen.dart';
import 'package:practice/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<Map<String, dynamic>> appointments = [
    {
      "doctor": "Dr. Amanda Jones",
      "speciality": "Cardiologist",
      "date": "2024-10-22",
      "time": "10:30 AM",
      "status": "Confirmed",
    },
    {
      "doctor": "Dr. Steven Clark",
      "speciality": "Dermatologist",
      "date": "2024-10-24",
      "time": "12:00 PM",
      "status": "Pending",
    },
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _bookAppointment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptScreen(
          doctorName: "Dr. John Doe", // Example, you can modify this
          speciality: "Cardiologist",
          appointmentDate: DateFormat('yyyy-MM-dd').format(_selectedDate),
          appointmentTime: _selectedTime.format(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        backgroundColor: Config.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Upcoming Appointments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/doctor1.jpg'),
                      ),
                      title: Text(appointments[index]['doctor']),
                      subtitle: Text(
                          '${appointments[index]['speciality']} - ${appointments[index]['date']} at ${appointments[index]['time']}'),
                      trailing: Text(
                        appointments[index]['status'],
                        style: TextStyle(
                          color: appointments[index]['status'] == 'Confirmed'
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
              'Book New Appointment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Date Selector
            ListTile(
              leading: const Icon(FontAwesomeIcons.calendar),
              title: Text('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
              trailing: IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () => _selectDate(context),
              ),
            ),
            // Time Selector
            ListTile(
              leading: const Icon(FontAwesomeIcons.clock),
              title: Text('Time: ${_selectedTime.format(context)}'),
              trailing: IconButton(
                icon: const Icon(Icons.access_time),
                onPressed: () => _selectTime(context),
              ),
            ),
            const SizedBox(height: 20),
            // Booking Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _bookAppointment, // Navigates to receipt screen
                child: const Text(
                  'Book Appointment',
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
