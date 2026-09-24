import 'package:flutter/material.dart';

import '../styles/nutri_styles.dart';
import '../widgets/benefit.dart';

class ObjetivosPage extends StatefulWidget {
  const ObjetivosPage({super.key});

  @override
  State<ObjetivosPage> createState() => _ObjetivosPageState();
}

class _ObjetivosPageState extends State<ObjetivosPage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(
        milliseconds: 900,
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
  // CADASTRO
  // ============================================================

  void criarConta() {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cadastro iniciado!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: controller,
            curve: Curves.easeOut,
          ),

          child: Column(
            children: [

              // ==================================================
              // FOTO
              // ==================================================

              SizedBox(
                height: 420,

                child: Stack(
                  children: [

                    Positioned.fill(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1000&q=85',

                        fit: BoxFit.cover,

                        errorBuilder: (
                            context,
                            error,
                            stackTrace,
                            ) {
                          return Container(
                            color: NutriStyles.verdeEscuro,

                            child: const Icon(
                              Icons.fitness_center,
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
                              Color(0x22000000),
                              Color(0xDD145A32),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ==================================================
                    // VOLTAR
                    // ==================================================

                    Positioned(
                      top: 15,
                      left: 15,

                      child: CircleAvatar(
                        backgroundColor:
                        Colors.white.withOpacity(0.9),

                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: NutriStyles.verdeEscuro,
                          ),

                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),

                    // ==================================================
                    // TEXTO
                    // ==================================================

                    Positioned(
                      left: 25,
                      right: 25,
                      bottom: 30,

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'Vamos juntos alcançar\nseus objetivos?',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 1.15,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Uma jornada de saúde começa '
                                'com pequenas escolhas.',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // CONTEÚDO
              // ==================================================

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    children: [

                      const SizedBox(height: 10),

                      const Text(
                        'Por onde começamos?',

                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: NutriStyles.texto,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ==================================================
                      // BENEFÍCIOS
                      // ==================================================

                      const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          Benefit(
                            icon: Icons.bolt_rounded,
                            text: 'Mais\nenergia',
                          ),

                          Benefit(
                            icon: Icons.favorite_border_rounded,
                            text: 'Melhor\nsaúde',
                          ),

                          Benefit(
                            icon:
                            Icons.self_improvement_rounded,
                            text: 'Corpo em\nequilíbrio',
                          ),

                          Benefit(
                            icon: Icons.eco_outlined,
                            text: 'Vida mais\nleve',
                          ),
                        ],
                      ),

                      const Spacer(),

                      // ==================================================
                      // CRIAR CONTA
                      // ==================================================

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          onPressed: criarConta,

                          style:
                          NutriStyles.botaoPrincipal.copyWith(
                            backgroundColor:
                            const WidgetStatePropertyAll(
                              NutriStyles.verde,
                            ),
                          ),

                          child: const Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [

                              Text(
                                'Criar minha conta',

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(width: 10),

                              Icon(
                                Icons.arrow_forward_rounded,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // ENTRAR
                      // ==================================================

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: OutlinedButton(
                          onPressed: () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Área de login.',
                                ),
                              ),
                            );
                          },

                          style:
                          NutriStyles.botaoSecundario,

                          child: const Text(
                            'Já tenho uma conta',

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        'NutriFit • Mais saúde, mais vida.',

                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}