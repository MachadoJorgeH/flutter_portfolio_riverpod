import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_app/pages/user_list_page.dart';
import 'package:portfolio_app/services/url_laucher_service.dart';

void main() {
  runApp(ProviderScope(child: const MyPortfolioApp()));
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Portfólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const UserListPage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text(
//           'Portfólio',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'DM Sans',
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background_orange.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage('assets/images/perfil_photo.jpeg'),
//               ),
//               Gap(16),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 child: const Text(
//                   'Jorge Henrique Machado',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'DM Sans',
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const Text(
//                 'Develop Flutter',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'DM Sans',
//                   color: Colors.black,
//                 ),
//               ),
//               Gap(10),
//               Text(
//                 'Systems Analysis and Development student, currently working as an intern at @MoovzApp.'
//                     ,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontFamily: 'DM Sans',
//                   color: Colors.black,
//                 )),
//               Gap(24),
//               CustomButton(
//                 label: 'LinkedIn',
//                 onPressed: () {
//                   launchURL(
//                     'https://www.linkedin.com/in/jorge-henrique-machado/',
//                   );
//                 },
//               ),
//               CustomButton(
//                 label: 'GitHub',
//                 onPressed: () {
//                   launchURL('https://github.com/MachadoJorgeH');
//                 },
//               ),
//               CustomButton(
//                 label: 'WhatsApp',
//                 onPressed: () {
//                   launchURL(
//                     'https://wa.me/+5562983102212?text=Olá,%20tudo%20bem?',
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const CustomButton({super.key, required this.label, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: ElevatedButton(onPressed: onPressed, child: Text(label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'DM Sans',
//             color: Colors.deepOrange,
//           ))),
//     );
//   }
// }

