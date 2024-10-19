import 'package:flutter/material.dart';
import 'package:practice/utils/config.dart'; // Ensure this import is correct

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.social,
  }) : super(key: key);

  final String social;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Define your onPressed functionality here
      },
      child: SizedBox(
        width: 100, // Set a fixed width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'assets/$social.png',
              width: 30,
              height: 20,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
