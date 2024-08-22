// import 'package:gym_project/modules/clients_accounts/clients.dart';
// import 'package:uuid/uuid.dart';
//
// class ClientRepository {
//   static List<ClientsBasicInfo> tabela = [
//     ClientsBasicInfo(
//       name: "Carlos",
//       frequencia: 3,
//       alunoCPF: '123.123.123-00',
//       vencimento: '30/072024',
//       sexo: 'Masculino',
//       objetivo: 'Hipertrofia',
//       avaliacao: '12/07/2024',
//       email: 'carlos@hotmai.com',
//       // id: const Uuid().v4(), // "1"
//       id: '1',
//       dataNascimento: '07/09/1997',
//     ),
//     ClientsBasicInfo(
//       name: "Jorge",
//       frequencia: 3,
//       alunoCPF: '123.123.123-01',
//       vencimento: 'Vencimento', sexo: '', objetivo: '',
//       avaliacao: '', email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997', //TODO : FAZER EN FORMATO DATE()
//     ),
//     ClientsBasicInfo(
//       name: "Pedro",
//       frequencia: 3,
//       alunoCPF: '123.123.123-02',
//       vencimento: 'Vencimento',
//       sexo: '',
//       objetivo: '',
//       avaliacao: '',
//       email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997',
//     ),
//     ClientsBasicInfo(
//       name: "Lais",
//       frequencia: 3,
//       alunoCPF: '123.123.123-03',
//       vencimento: 'Vencimento',
//       sexo: '',
//       objetivo: '',
//       avaliacao: '',
//       email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997',
//     ),
//     ClientsBasicInfo(
//       name: "Isabella",
//       frequencia: 3,
//       alunoCPF: '123.123.123-04',
//       vencimento: 'Vencimento',
//       sexo: '',
//       objetivo: '',
//       avaliacao: '',
//       email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997',
//     ),
//     ClientsBasicInfo(
//       name: "Sabrina",
//       frequencia: 3,
//       alunoCPF: '123.123.123-05',
//       vencimento: 'Vencimento',
//       sexo: '',
//       objetivo: '',
//       avaliacao: '',
//       email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997',
//     ),
//     ClientsBasicInfo(
//       name: "paulo",
//       frequencia: 3,
//       alunoCPF: '123.123.123-06',
//       vencimento: 'Vencimento',
//       sexo: '',
//       objetivo: '',
//       avaliacao: '',
//       email: '',
//       id: const Uuid().v4(),
//       dataNascimento: '07/09/1997',
//     ),
//   ];
//   static String generateId() {
//     var uuid = const Uuid();
//     return uuid.v4();
//   }
//
//   static void addClient(ClientsBasicInfo client) {
//     tabela.add(client);
//   }
//
//   static ClientsBasicInfo? getClientById(String id) {
//     try {
//       return tabela.firstWhere((client) => client.id == id);
//     } catch (e) {
//       return null;
//     }
//   }
// }

import 'dart:convert';

import 'package:gym_project/modules/clients_accounts/clients.dart';
import 'package:http/http.dart' as http;

class ClientRepository {
  static const String _baseUrl = 'http://localhost:8000/alunos/';

  // Fetch all clients
  static Future<List<ClientsBasicInfo>> fetchClients() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      List<ClientsBasicInfo> lista = [];
      for (var client in data) {
        lista.add(ClientsBasicInfo.fromJson(client));
      }
      return lista;
      // return data.map((json) => ClientsBasicInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }

  // Fetch a single client by ID
  static Future<ClientsBasicInfo> fetchClientById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl$id/'));

    if (response.statusCode == 200) {
      return ClientsBasicInfo.fromJson(json.decode(response.body));
    } else {
      print(
          'Erro ao carregar dados do cliente: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load client');
    }
  }

  // Add a new client
  static Future<void> addClient(ClientsBasicInfo client) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'nome': client.name,
        'sexo': client.sexo,
        'cpf': client.alunoCPF,
        'vencimento_plano_treino': client.vencimento,
        'objetivo': client.objetivo,
        'avaliacao': client.avaliacao,
        'email': client.email,
        'data_nascimento': client.dataNascimento,
        'foto': client.imagePath,
        'telefone': client.telefone,
      }),
    );

    if (response.statusCode != 201) {
      print(response.body);
      print(response.statusCode);
      throw Exception('Failed to add client');
    }
  }

  // Update an existing client
  static Future<void> updateClient(String id, ClientsBasicInfo client) async {
    final response = await http.put(
      Uri.parse('$_baseUrl$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'name': client.name,
        'sexo': client.sexo,
        'alunoCPF': client.alunoCPF,
        'vencimento': client.vencimento,
        'objetivo': client.objetivo,
        'avaliacao': client.avaliacao,
        'email': client.email,
        'dataNascimento': client.dataNascimento,
        'imagePath': client.imagePath,
        'telefone': client.telefone,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update client');
    }
  }

  // Delete a client
  static Future<void> deleteClient(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete client');
    }
  }
}
