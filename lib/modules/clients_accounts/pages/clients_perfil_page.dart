import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_project/modules/clients_accounts/clients.dart';
import 'package:gym_project/modules/clients_accounts/widgets/date_convertor_age.dart';
import 'package:gym_project/utils/app_style.dart';
import 'package:gym_project/widgets/buttons/custom_button.dart';

class ClientsPerfilPage extends StatelessWidget {
  final ClientsBasicInfo client;

  const ClientsPerfilPage({
    super.key,
    required this.client,
  });

  //TODO : Criar pagina de perfil dos alunos ...

  @override
  Widget build(BuildContext context) {
    final int idade =
        DateConvertorAge.calcularIdadeComFormatacao(client.dataNascimento);
    return Scaffold(
      backgroundColor: AppTheme.medium,
      appBar: AppBar(
        title: const Text('Perfil do Aluno'),
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: client.imagePath != null
                      ? NetworkImage(client.imagePath!)
                      : null,
                  child: client.imagePath == null ? Icon(Icons.person) : null,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      client.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "IDADE: $idade",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "OBJETIVO: ${client.objetivo}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            // const SizedBox(height: 8),
            //informacoes adicinais
            _buildInfoRow('Telefone:', client.telefone),

            _buildInfoRow('Sexo:', client.sexo),
            _buildInfoRow('Email:', client.email),
            _buildInfoRow('CPF:', client.alunoCPF),

            //BOTOES DE AVALIACOES E TREINOS

            const SizedBox(height: 24),

            _buildInfoRow("FREQUENCIA:", client.frequencia.toString()),
            _buildInfoRow("DATA PLANO:", client.vencimento),

            //FREQUENCIA DE DATA DO PLANO

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  onPressed: () {},
                  text: "Avaliação",
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                CustomButton(
                  onPressed: () {},
                  text: "Treinos",
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Row(
      children: [
        Text(
          '$label ',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        // Expanded(
        //   child: Text(
        //     value ?? 'N/A',
        //     style: const TextStyle(fontSize: 18, color: Colors.white),
        //   ),
        // ),
        Text(
          value ?? 'N/A',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
