import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_app/pages/user_detail_page.dart';
import '../providers/user_provider.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider); // Observar o estado do tema
    final usersAsync = ref.watch(userListProvider);
    final searchText = ref.watch(searchTextProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'DM Sans',
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDarkTheme
            ? Colors.black
            : Colors.orange.shade100,
        actions: [
          IconButton(
            icon: Icon(
              isDarkTheme
                  ? Icons.wb_sunny
                  : Icons.nightlight_round, // Ícone de sol ou lua
              color: isDarkTheme ? Colors.yellow : Colors.black,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  !isDarkTheme; // Alternar o tema
            },
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: isDarkTheme
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : Colors.black,
            ),
            onPressed: () {
              ref.refresh(userListProvider);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkTheme
                ? [
                    Colors.black,
                    Colors.grey.shade800,
                  ] // Gradiente para tema escuro
                : [
                    Colors.orange.shade100,
                    Colors.orange.shade900,
                  ], // Gradiente para tema claro
          ),
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref.read(searchTextProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: 'Search users',
                hintStyle: TextStyle(
                  color: isDarkTheme
                      ? Colors.white
                      : Colors.black, // Cor do texto do hint
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDarkTheme
                      ? Colors.white
                      : Colors.black, // Cor do ícone
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isDarkTheme
                        ? Colors.white
                        : Colors.black, // Cor da borda
                    width: 2.0, // Espessura da borda
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isDarkTheme
                        ? Colors.yellow
                        : Colors.orange, // Cor da borda focada
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: isDarkTheme
                        ? Colors.white
                        : Colors.black, // Cor da borda habilitada
                    width: 2.0,
                  ),
                ),
              ),
              style: TextStyle(
                color: isDarkTheme
                    ? Colors.white
                    : Colors.black, // Cor do texto digitado
                fontSize: 16,
              ),
            ),
            const Gap(16),
            Expanded(
              child: usersAsync.when(
                data: (users) {
                  final filteredUsers = users.where((user) {
                    return user.name.toLowerCase().contains(
                      searchText.toLowerCase(),
                    );
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isDarkTheme
                              ? Colors.grey.shade900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkTheme
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black.withOpacity(0.3),
                              blurRadius: 4.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person,
                                color: isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const Gap(8),
                              Text(
                                user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkTheme
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '${user.email}\n${user.phone}',
                            style: TextStyle(
                              color: isDarkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailPage(
                                  name: user.name,
                                  email: user.email,
                                  phone: user.phone,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isDarkTheme
                            ? [Colors.grey.shade800, Colors.black]
                            : [Colors.orange.shade100, Colors.orange.shade900],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
                error: (error, stack) => Center(
                  child: Text(
                    'Erro: $error',
                    style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
