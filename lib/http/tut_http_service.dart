import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/from_json_model.dart';

class GenericHttpService<T extends FromJsonContract<T>> {
  final String baseUrl;
   final T instance; // Adicione uma instância de T

  GenericHttpService(this.baseUrl, this.instance);

  Future<List<T>> fetchAll(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => instance.fromJson(json)).toList();
    } else {
      throw Exception('Erro na chamada de serviço: ${response.statusCode}');
    }
  }

  Future<T> fetchOne(String endpoint, int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return this.instance.fromJson(data);
    } else {
      throw Exception('Erro na chamada de serviço: ${response.statusCode}');
    }
  }

  Future<T> create(String endpoint, T item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return this.instance.fromJson(data);
    } else {
      throw Exception('Erro na chamada de serviço: ${response.statusCode}');
    }
  }

  Future<T> update(String endpoint, T item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint/${item.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return this.instance.fromJson(data);
    } else {
      throw Exception('Erro na chamada de serviço: ${response.statusCode}');
    }
  }

  Future<void> delete(String endpoint, int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint/$id'));

    if (response.statusCode != 204) {
      throw Exception('Erro na chamada de serviço: ${response.statusCode}');
    }
  }
}
