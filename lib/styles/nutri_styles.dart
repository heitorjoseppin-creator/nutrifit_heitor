import 'package:flutter/material.dart';

class NutriStyles {
  NutriStyles._();

  // ============================================================
  // CORES DA MARCA
  // ============================================================

  static const Color verdeEscuro = Color(0xFF145A32);

  static const Color verde = Color(0xFF2E7D32);

  static const Color verdeMedio = Color(0xFF66BB6A);

  static const Color verdeClaro = Color(0xFFE8F5E9);

  static const Color verdeMuitoClaro = Color(0xFFF1F8F2);

  static const Color fundo = Color(0xFFF7FAF7);

  static const Color texto = Color(0xFF172A1B);

  static const Color textoSecundario = Color(0xFF68756B);

  static const Color borda = Color(0xFFE1ECE2);

  // ============================================================
  // SOMBRA DOS CARDS
  // ============================================================

  static List<BoxShadow> sombraCard = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 12,
      offset: const Offset(0, 5),
    ),
  ];

  // ============================================================
  // TÍTULOS
  // ============================================================

  static const TextStyle tituloPrincipal = TextStyle(
    fontSize: 29,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.15,
  );

  static const TextStyle tituloSecao = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: texto,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 14,
    color: textoSecundario,
    height: 1.4,
  );

  // ============================================================
  // BOTÃO PRINCIPAL
  // ============================================================

  static ButtonStyle botaoPrincipal = ElevatedButton.styleFrom(
    backgroundColor: verdeMedio,
    foregroundColor: Colors.white,
    elevation: 5,
    minimumSize: const Size(double.infinity, 55),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  // ============================================================
  // BOTÃO SECUNDÁRIO
  // ============================================================

  static ButtonStyle botaoSecundario = OutlinedButton.styleFrom(
    foregroundColor: verde,
    minimumSize: const Size(double.infinity, 55),
    side: const BorderSide(
      color: verde,
      width: 1.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}