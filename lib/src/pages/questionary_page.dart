import 'package:flutter/material.dart';
import 'package:dmtestes/src/components/app_header.dart';
import 'package:dmtestes/src/core/app_color.dart';

import '../components/app_answer_card.dart';
import '../components/app_progress_bar.dart';
import '../components/app_question_card.dart';

class QuestionaryPage extends StatefulWidget {
  final DmSemanticColor colorsDm;

  const QuestionaryPage({super.key, required this.colorsDm});

  @override
  State<QuestionaryPage> createState() => _QuestionaryPageState();
}

class _QuestionaryPageState extends State<QuestionaryPage> {
  int selectedIndex = -1;

  final List<String> answers = [
    'A) Inovação contínua.',
    'B) Maximização do lucro.',
    'C) Estagnação.',
    'D) Conformidade rígida.',
    'E) Desenvolvimento sustentável.',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = widget.colorsDm;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppHeader(
        label: 'Prova de retenção',
        icon: Icons.arrow_back,
        colors: colors,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppProgressBar(currentQuestion: 4, totalQuestion: 10, progress: 40),
            const SizedBox(height: 24),

            AppQuestionCard(
              question:
                  '4 – Qual dos seguintes valores é fundamental para a empresa?',
              colors: colors,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return AppAnswerCard(
                    text: answers[index],
                    selected: selectedIndex == index,
                    colors: colors,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Anterior'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedIndex == -1 ? null : () {},
                    child: const Text('Próxima'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
