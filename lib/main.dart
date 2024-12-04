import 'package:flutter/material.dart';
import 'package:pms_app/pages/add_stock.dart';
import 'package:pms_app/pages/drinks_page.dart';
import 'package:pms_app/pages/foods_page.dart';
import 'package:pms_app/pages/order_history_page.dart';
import 'package:pms_app/pages/order_preview_page.dart';
import 'auth/loginPage.dart';
import 'auth/signUpPage.dart';
import 'models/order.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE26A05).withOpacity(0.6),
          secondary: Colors.white,
          surface: Colors.black,

          
        ),
      ),

      onGenerateRoute: (settings) {
        if (settings.name == '/confirmOrder') {
          return MaterialPageRoute(
            builder: (context) => OrderPreviewPage(),
          );
        }
        // Handle other routes...
        return null;
      },
      routes: {
        '/home': (context) => HomePage(),
        '/foods': (context) => const FoodsPage(),
        '/drinks': (context) => const DrinksPage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/orderHistory': (context) => OrderHistoryPage(),
        '/add':(context)=>const StockAdd(),
      },
      home: const HomePage(),
    );
  }
}
