
import 'package:expandable_appbar/providers/appbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home/expandable_appbar.dart';

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
        ChangeNotifierProvider(create: (context) => DarggableAppBarProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExpandableAppBar(),
      ),
    );
  }
}
