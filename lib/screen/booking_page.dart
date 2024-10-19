import 'package:flutter/material.dart';
import 'package:practice/components/custom_appbar.dart';
import 'package:practice/utils/config.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key); // Mark constructor as const

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Calendar-related declarations
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  int? _currentIndex; // Added to track the selected time index
  bool isWeekend = false; // Check if the selected date is a weekend
  bool dateSelected = false; // Track if a date is selected
  bool timeSelected = false; // Track if a time is selected

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Appointment',
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      "Select the Consultation Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                // Additional UI components can go here
              ],
            ),
          ),
          if (isWeekend) // Use 'if' statement to check if it is a weekend
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                alignment: Alignment.center,
                child: const Text(
                  "Weekend is not available",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          else
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        timeSelected = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index ? Colors.white : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: _currentIndex == index ? Config.primaryColor : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _currentIndex == index ? Colors.white : null,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 6, // Assuming you want 6 time slots
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
            ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Button width
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'success_booking');
                },
                child: const Text("Make Appointment"),
                // Disable button based on conditions
                // Use the variables correctly to manage the button state
                // Adjust this condition based on your logic
              ),
            ),
          )
        ],
      ),
    );
  }

  // Corrected _tableCalendar widget and logic
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2030, 12, 31),
      calendarFormat: format,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      rowHeight: 40,
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: "Month",
      },
      onFormatChanged: (format) {
        setState(() {
          this.format = format; // Fixed: update the correct variable
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = focusedDay;
          dateSelected = true;

          // Check if the selected day is a weekend
          if (selectedDay.weekday == DateTime.saturday || selectedDay.weekday == DateTime.sunday) {
            isWeekend = true;
          } else {
            isWeekend = false;
          }
        });
      },
    );
  }
}
