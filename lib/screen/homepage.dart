import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import for FontAwesome icons
import 'package:practice/components/appointment_card.dart';
import 'package:practice/components/doctorcard.dart';
import 'package:practice/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor, // Corrected icon name
      "category": "General"
    },
    {
      "icon": FontAwesomeIcons.heartPulse, // Corrected icon name
      "category": "Cardiology" // Corrected spelling
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respiration"
    },
    {
      "icon": FontAwesomeIcons.handHoldingMedical, // Corrected to match icon context
      "category": "Dermatology"
    },
    {
      "icon": FontAwesomeIcons.personPregnant, // Corrected icon name
      "category": "Gynecology" // Corrected spelling
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Assuming Config().init(context) is a method you've defined elsewhere
    Config().init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child:SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Amanda", // Hardcoded user name for now
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  )
                ],
              ),
              Config.spaceSmall,
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Config.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FaIcon(
                              medCat[index]['icon'],
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              medCat[index]['category'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Config.spaceSmall,
              const Text("Appointment Today",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              Config.spaceSmall,
              AppointmentCard(),
              Config.spaceSmall,
              const Text("Top Doctors",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
              Config.spaceSmall,
              Column(
                children: List.generate(1, (index) {
                  return DoctorCard(route: 'doc_details');
                }
              ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
