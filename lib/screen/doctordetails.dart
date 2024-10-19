import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/components/Button.dart';
import 'package:practice/components/custom_appbar.dart';
import 'package:practice/utils/config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false; // Boolean to track favorite status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Doctor Details',// Correct icon usage
        actions: [
          IconButton(
            icon: isFav
                ? const FaIcon(FontAwesomeIcons.solidHeart, color: Colors.red)
                : const FaIcon(FontAwesomeIcons.heart),
            onPressed: () {
              setState(() {
                isFav = !isFav; // Toggle favorite status
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child:Column(
          children: <Widget>[
            AboutDoctor(),
            DetailBody(),
            Spacer(),
            Padding(padding: EdgeInsets.all(20),
            child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                onPressed: (){
                  Navigator.of(context).pushNamed('booking_page');
                },
                disable: false
            ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/doctor2.jpg'),
          ),
          Config.spaceMedium,
          const Text("Dr.AMAN",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          Config.spaceSmall,
          const Text("MBBS{International Medical University",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          softWrap: true,
          textAlign: TextAlign.center,
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize*0.75,
           child: const Text("Sawshi Hospital",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
  }

  class DetailBody extends StatelessWidget {
    const DetailBody({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Config.spaceSmall,
            DoctorInfo(),
            Config.spaceSmall,
            Text("About Doctor",style: TextStyle(fontWeight: FontWeight.w600)),
          Config.spaceSmall,
            Text("Dr Richard is an experiance doctor in Dentest.A doctor, also known as a physician, is a specially trained and licensed medical professional",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,)
          ],
        ),
      );
    }
  }

  class DoctorInfo extends StatelessWidget {
    const DoctorInfo({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Row(
        children: <Widget>[
          InfoCard(label: 'patient', value: '104'),
          SizedBox(width: 15),
          InfoCard(label: 'Experiance', value: '10Yrs'),
          SizedBox(width: 15),
          InfoCard(label: 'Ratinf', value: '5.4'),
        ],
      );
    }
  }

  class InfoCard extends StatelessWidget {
    const InfoCard({super.key, required this.label, required this.value});
    final String label;
    final String value;

    @override
    Widget build(BuildContext context) {
      return  Expanded(child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Config.primaryColor,
        ),
        padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 15
        ),
        child: Column(
          children: <Widget>[
            Text(label,style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 10),
            Text(value,style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),)
          ],
        ),
      ));
    }
  }
