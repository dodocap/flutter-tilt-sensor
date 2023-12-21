import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

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

                return Positioned(
                  left: centerX + accEvent.y * 20,
                  top: centerY + accEvent.x * 20,
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
              }),
        ],
      ),
    );
  }
}
