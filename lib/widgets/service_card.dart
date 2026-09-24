import 'package:flutter/material.dart';

import '../styles/nutri_styles.dart';

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool pressionado = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          pressionado = true;
        });
      },

      onTapUp: (_) {
        setState(() {
          pressionado = false;
        });
      },

      onTapCancel: () {
        setState(() {
          pressionado = false;
        });
      },

      child: AnimatedScale(
        scale: pressionado ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),

        child: Container(
          margin: const EdgeInsets.only(bottom: 12),

          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(19),

            border: Border.all(
              color: NutriStyles.borda,
            ),

            boxShadow: NutriStyles.sombraCard,
          ),

          child: Row(
            children: [

              // ÍCONE
              Container(
                width: 53,
                height: 53,

                decoration: BoxDecoration(
                  color: NutriStyles.verdeClaro,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Icon(
                  widget.icon,
                  color: NutriStyles.verde,
                  size: 28,
                ),
              ),

              const SizedBox(width: 15),

              // TEXTOS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.title,

                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                        color: NutriStyles.texto,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.description,

                      style: const TextStyle(
                        fontSize: 12.5,
                        color: NutriStyles.textoSecundario,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              // SETA
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: NutriStyles.verde,
              ),
            ],
          ),
        ),
      ),
    );
  }
}