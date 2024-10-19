import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // Import video_player

class SuccessBooking extends StatefulWidget {
  const SuccessBooking({super.key});

  @override
  State<SuccessBooking> createState() => _SuccessBookingState();
}

class _SuccessBookingState extends State<SuccessBooking> {
  late VideoPlayerController _controller; // Declare the video controller

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/success.mp4') // Initialize the video controller
      ..initialize().then((_) {
        setState(() {}); // Update the UI when the video is loaded
        _controller.play(); // Play the video automatically
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not in use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _controller.value.isInitialized // Check if the video is initialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Center(child: CircularProgressIndicator()), // Show a loading indicator while the video is loading
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Successfully Booked",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ElevatedButton( // Use ElevatedButton for the action
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Button size
                ),
                child: const Text('Back To HomePage'), // Button text
                onPressed: () {
                  Navigator.of(context).pushNamed('main'); // Navigate to main
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


