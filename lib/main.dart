import 'package:flutter/material.dart';
import 'src/core/app_color.dart';
import 'src/pages/questionary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = DmSemanticColor.light();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DM Testes',
      theme: ThemeData(
        scaffoldBackgroundColor: colors.backgroundPrimary,
        useMaterial3: true,
      ),
      home: QuestionaryPage(colorsDm: colors),
    );
  }
}
