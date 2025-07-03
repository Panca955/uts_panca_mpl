import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'pages/login_page.dart';
import 'services/cart_service.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(), 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UTS E-Commerce Panca',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const LoginPage(),
      ),
    );
  }
}
