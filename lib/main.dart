import 'package:arz/home_page.dart';
import 'package:arz/models/network_helper.dart';
import 'package:arz/travelApp/home_travel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NetworkHelper())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
                titleLarge: TextStyle(fontSize: 18, color: Colors.black54),
                titleMedium: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          home: const TravelPage(),
        ));
  }
}
