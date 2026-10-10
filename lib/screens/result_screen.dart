import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {
  final double bmi;
  final int age;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.age,
  });

  static const Color backgroundColor = Color(0xFF080D20);
  static const Color cardColor = Color(0xFF191F38);
  static const Color redColor = Color(0xFFFF2118);

  String get resultText {
    if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi < 25) {
      return 'NORMAL';
    } else if (bmi < 30) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESE';
    }
  }

  Color get resultColor {
    if (bmi < 18.5) {
      return Colors.lightBlueAccent;
    } else if (bmi < 25) {
      return const Color(0xFF00E676);
    } else if (bmi < 30) {
      return Colors.orangeAccent;
    } else {
      return Colors.redAccent;
    }
  }

  String get interpretation {
    if (bmi < 18.5) {
      return 'Your BMI is below the normal range. Consider discussing your nutrition with a healthcare professional.';
    } else if (bmi < 25) {
      return 'Your BMI is within the normal range. Keep maintaining healthy habits.';
    } else if (bmi < 30) {
      return 'Your BMI is above the normal range. Balanced nutrition and regular activity may help.';
    } else {
      return 'Your BMI is in the obesity range. Consider discussing your health goals with a healthcare professional.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Your Result:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 42,
                  ),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Text(
                        resultText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: resultColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 78,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Age: $age',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          height: 1.5,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: redColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'RECALCULATE',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}