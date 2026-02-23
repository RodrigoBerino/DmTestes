import 'package:dmtestes/src/components/app_header.dart';
import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';

class QuestionaryPage extends StatelessWidget {
  final DmSemanticColor colorsDm;
  const QuestionaryPage({super.key, required this.colorsDm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsDm.backgroundPrimary,
      appBar: AppHeader(
        label: 'Prova de retenção',
        icon: Icons.arrow_back,
        colors: colorsDm,
      ),
      body: const Center(child: Text('conteúdo body')),
    );
  }
}
