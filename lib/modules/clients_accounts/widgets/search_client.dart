// import 'package:gym_project/modules/clients_accounts/clients.dart';
// import 'package:gym_project/modules/clients_accounts/repositories/client_repository.dart';
//
// List<ClientsBasicInfo> searchClients(String query) {
//   if (query.isEmpty) {
//     return ClientRepository.fetchClients();
//   }
//   return ClientRepository.tabela
//       .where(
//         (client) => client.name.toLowerCase().contains(
//               query.toLowerCase(),
//             ),
//       )
//       .toList();
// }
import 'dart:convert';

import 'package:gym_project/modules/clients_accounts/clients.dart';
import 'package:http/http.dart' as http;

Future<List<ClientsBasicInfo>> searchClients(String query) async {
  final url = Uri.parse('http://localhost:8000/alunos?search=$query');
  final response = await http.get(url);
  try {
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Mapear a resposta JSON para uma lista de ClientsBasicInfo
      return data.map((json) => ClientsBasicInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  } catch (e) {
    print('Error fetching clients: $e');
    return [];
  }
}
