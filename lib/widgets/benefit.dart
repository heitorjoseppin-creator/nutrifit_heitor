import 'package:flutter/material.dart';

import '../styles/nutri_styles.dart';

class Benefit extends StatelessWidget {
  final IconData icon;
  final String text;

  const Benefit({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,

      child: Column(
        children: [

          Container(
            width: 56,
            height: 56,

            decoration: const BoxDecoration(
              color: NutriStyles.verdeClaro,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: NutriStyles.verde,
              size: 28,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            text,

            textAlign: TextAlign.center,

            style: const TextStyle(
              color: NutriStyles.verdeEscuro,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}