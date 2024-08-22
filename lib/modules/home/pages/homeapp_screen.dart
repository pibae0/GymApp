import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_project/utils/app_style.dart';

import '../../../widgets/buttons/custom_button.dart';

class HomeappScreen extends StatefulWidget {
  const HomeappScreen({super.key});

  @override
  State<HomeappScreen> createState() => _HomeappScreenState();
}

class _HomeappScreenState extends State<HomeappScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.medium,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Ola, Gustavo',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () => context.pushNamed('clients'),
                      text: 'Alunos',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      onPressed: () => print("acessando treinos"),
                      text: 'Treinos',
                    ),
                  ],
                ),
              ),
              const Text(
                'App em desenvolvimento',
                style: TextStyle(color: AppTheme.accent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
