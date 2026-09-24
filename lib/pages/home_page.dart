import 'package:flutter/material.dart';

import '../styles/nutri_styles.dart';
import '../widgets/service_card.dart';
import 'objetivos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<double> fadeAnimation;

  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(
        milliseconds: 1100,
      ),
    );

    fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // ============================================================
  // ABRIR SEGUNDA TELA
  // ============================================================

  void abrirObjetivos() {

    Navigator.push(
      context,

      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 600,
        ),

        pageBuilder: (
            context,
            animation,
            secondaryAnimation,
            ) {
          return const ObjetivosPage();
        },

        transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
            ) {

          final slide = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ),
          );

          return FadeTransition(
            opacity: animation,

            child: SlideTransition(
              position: slide,

              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: NutriStyles.fundo,

      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,

          child: SlideTransition(
            position: slideAnimation,

            child: SingleChildScrollView(
              child: Column(
                children: [

                  // ==================================================
                  // HERO
                  // ==================================================

                  SizedBox(
                    height: 570,

                    child: Stack(
                      children: [

                        // FOTO
                        Positioned.fill(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=1000&q=85',

                            fit: BoxFit.cover,

                            errorBuilder: (
                                context,
                                error,
                                stackTrace,
                                ) {

                              return Container(
                                color: NutriStyles.verdeEscuro,

                                child: const Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              );
                            },
                          ),
                        ),

                        // GRADIENTE
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [
                                  Colors.transparent,
                                  Color(0x25000000),
                                  Color(0xE6143D20),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ==================================================
                        // LOGO
                        // ==================================================

                        Positioned(
                          top: 25,
                          left: 0,
                          right: 0,

                          child: Column(
                            children: [

                              Container(
                                width: 65,
                                height: 65,

                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.94),
                                  shape: BoxShape.circle,

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),

                                child: const Icon(
                                  Icons.eco_rounded,
                                  color: NutriStyles.verde,
                                  size: 38,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'NutriFit',

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,

                                  shadows: [
                                    Shadow(
                                      color: Colors.black45,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),

                              const Text(
                                'Mais saúde, mais vida.',

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ==================================================
                        // FRASE
                        // ==================================================

                        Positioned(
                          left: 25,
                          right: 25,
                          bottom: 100,

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              const Text(
                                'Comida de verdade\npara uma ',

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15,
                                ),
                              ),

                              const Text(
                                'vida melhor.',

                                style: TextStyle(
                                  color: Color(0xFF8FE38F),
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Text(
                                'Nutrição personalizada, '
                                    'acompanhamento especializado '
                                    'e tudo que você precisa '
                                    'para alcançar seus objetivos.',

                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.92),
                                  fontSize: 15,
                                  height: 1.45,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ==================================================
                        // BOTÃO
                        // ==================================================

                        Positioned(
                          bottom: 20,
                          left: 25,
                          right: 25,

                          child: SizedBox(
                            height: 55,

                            child: ElevatedButton(
                              onPressed: abrirObjetivos,

                              style: NutriStyles.botaoPrincipal,

                              child: const Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,

                                children: [

                                  Text(
                                    'Começar agora',

                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ==================================================
                  // SERVIÇOS
                  // ==================================================

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      22,
                      30,
                      22,
                      30,
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(
                          'O que oferecemos',

                          style: NutriStyles.tituloSecao,
                        ),

                        const SizedBox(height: 7),

                        const Text(
                          'Tudo para cuidar da sua saúde e bem-estar.',

                          style: NutriStyles.subtitulo,
                        ),

                        const SizedBox(height: 20),

                        // CONSULTA
                        const ServiceCard(
                          icon: Icons.person_outline_rounded,
                          title: 'Consulta Nutricional',
                          description:
                          'Avaliação completa das suas necessidades.',
                        ),

                        // PLANO
                        const ServiceCard(
                          icon: Icons.description_outlined,
                          title:
                          'Plano Alimentar Personalizado',
                          description:
                          'Alimentação adaptada aos seus objetivos.',
                        ),

                        // ACOMPANHAMENTO
                        const ServiceCard(
                          icon: Icons.calendar_month_outlined,
                          title:
                          'Acompanhamento Semanal',
                          description:
                          'Suporte para acompanhar sua evolução.',
                        ),

                        // BIOIMPEDÂNCIA
                        const ServiceCard(
                          icon: Icons.monitor_weight_outlined,
                          title: 'Bioimpedância',
                          description:
                          'Análise da composição corporal.',
                        ),

                        // RECEITAS
                        const ServiceCard(
                          icon: Icons.restaurant_menu_rounded,
                          title: 'Receitas Fit',
                          description:
                          'Receitas práticas, saborosas e equilibradas.',
                        ),

                        const SizedBox(height: 15),

                        // ==================================================
                        // PROPÓSITO
                        // ==================================================

                        Container(
                          width: double.infinity,

                          padding: const EdgeInsets.all(20),

                          decoration: BoxDecoration(
                            color: NutriStyles.verdeEscuro,

                            borderRadius:
                            BorderRadius.circular(22),
                          ),

                          child: const Row(
                            children: [

                              Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                                size: 35,
                              ),

                              SizedBox(width: 15),

                              Expanded(
                                child: Text(
                                  'Seu bem-estar é o nosso propósito.',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}