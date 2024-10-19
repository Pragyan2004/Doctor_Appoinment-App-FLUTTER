import 'package:flutter/material.dart';
import 'package:practice/utils/config.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20), // Ensure padding has const and set to proper spacing
          child: Column( // Changed Row to Column for vertical layout
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor1.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Dr. Richard", // Corrected capitalization and spelling
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Dental",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(), // ScheduleCard placed after the doctor's info
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded
                    (child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent
                      ),
                  child: Text("Cancel",style: TextStyle(
                    color: Colors.white
                  ),),
                    onPressed: (){},
                  )
                  ),
                  SizedBox(width: 20),
                  Expanded
                    (child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    child: Text("Complete",style: TextStyle(
                        color: Colors.white
                    ),),
                    onPressed: (){},
                  )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Adding transparency for style
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today, // Fixed typo "calander_today"
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 10), // Added spacing between icon and text
          const Text(
            "Monday, 11/28/2024",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: 5),
          const Flexible(
            child: Text(
              "10:00 PM",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
