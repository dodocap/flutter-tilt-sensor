import 'package:flutter/material.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              // BoxDecoration 동시 사용시 중복 오류 주의!
              // color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
