import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEventStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final AccelerometerEvent accEvent = snapshot.data!;
              print('${accEvent.x} ${accEvent.y} ${accEvent.z}');

              return Positioned(
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
              );
            }
          ),
        ],
      ),
    );
  }
}
