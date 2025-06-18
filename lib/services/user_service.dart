import 'package:dio/dio.dart';
import 'package:portfolio_app/models/user.dart';


//Serviço que busca os dados da API
class UserService {
  Future<List<User>> fetchUsers() async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          headers: {'Accept': 'application/json', 'User-Agent': 'FlutterApp'},
        ),
      );
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar usuários: $e');
      throw Exception('Failed to fetch users');
    }
  }
}
