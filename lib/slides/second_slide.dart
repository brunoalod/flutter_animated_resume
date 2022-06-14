import 'package:flutter/material.dart';

class SecondSlide extends StatelessWidget {
  const SecondSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Hi!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Text(
            'I\'m Bruno Alod. I do sofware development using Laravel for backend, Vue.js for frontend, and Flutter for mobile applications.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
