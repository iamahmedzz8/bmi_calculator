import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/height_card.dart';
import '../widgets/counter_card.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color backgroundColor = Color(0xFF080D20);
  static const Color cardColor = Color(0xFF191F38);
  static const Color redColor = Color(0xFFFF2118);

  String selectedGender = '';
  double height = 170;
  int weight = 60;
  int age = 20;

  void calculateBMI() {
    if (selectedGender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender first.'),
        ),
      );
      return;
    }

    final double heightInMeters = height / 100;
    final double bmi = weight / (heightInMeters * heightInMeters);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmi: bmi,
          age: age,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 25),
              alignment: Alignment.center,
              color: cardColor,
              child: const Text(
                'BMI calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GenderCard(
                          icon: Icons.female,
                          title: 'FEMALE',
                          selected: selectedGender == 'Female',
                          onTap: () {
                            setState(() {
                              selectedGender = 'Female';
                            });
                          },
                        ),
                        const SizedBox(width: 24),
                        GenderCard(
                          icon: Icons.male,
                          title: 'MALE',
                          selected: selectedGender == 'Male',
                          onTap: () {
                            setState(() {
                              selectedGender = 'Male';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    HeightCard(
                      height: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                    const SizedBox(height: 48),
                    Row(
                      children: [
                        Expanded(
                          child: CounterCard(
                            title: 'WEIGHT',
                            value: weight,
                            onIncrement: () {
                              setState(() {
                                if (weight < 300) {
                                  weight++;
                                }
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                if (weight > 1) {
                                  weight--;
                                }
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: CounterCard(
                            title: 'AGE',
                            value: age,
                            onIncrement: () {
                              setState(() {
                                if (age < 120) {
                                  age++;
                                }
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                if (age > 1) {
                                  age--;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 78,
              child: ElevatedButton(
                onPressed: calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}