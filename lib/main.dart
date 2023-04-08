import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_handler/providers/cart_provider.dart';
import 'package:state_handler/providers/theme_provider.dart';
import 'package:state_handler/res/globals.dart';
import 'package:state_handler/views/screens/homepage.dart';
import 'package:state_handler/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prep = await SharedPreferences.getInstance();
  global.data = prep.getBool('data') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.green, primary: Colors.green)),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).isdrk)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const home_page(),
          'splash_screen': (context) => const splash_screen(),
        },
      ),
    ),
  );
}