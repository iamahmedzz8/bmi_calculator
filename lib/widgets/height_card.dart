import 'package:flutter/material.dart';
class HeightCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightCard({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF191F38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'HEIGHT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'CM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: 54,
            height: 54,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFFF2118),
              shape: BoxShape.circle,
            ),
            child: Text(
              height.round().toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              activeTrackColor: Colors.deepPurpleAccent,
              inactiveTrackColor: const Color(0xFF514875),
              thumbColor: const Color(0xFFFF2118),
              overlayColor: const Color(0x22FF2118),
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 8,
              ),
            ),
            child: Slider(
              value: height,
              min: 100,
              max: 220,
              divisions: 120,
              onChanged: onChanged,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '100 cm',
                style: TextStyle(color: Colors.white54),
              ),
              Text(
                '220 cm',
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}