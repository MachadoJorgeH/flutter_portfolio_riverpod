import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/models/user.dart';
import '../services/user_service.dart';

//Instancia do serviço
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
},);

//Provider responsável por buscar os usuarios
final userListProvider = FutureProvider<List<User>>((ref) async {
  final userService = ref.watch(userServiceProvider);
  return userService.fetchUsers();  
});

final searchTextProvider = StateProvider<String>((ref) => '');

final themeProvider = StateProvider<bool>((ref) => false); // false = tema claro, true = tema escuro