class QuizQuestion {
  final int number;
  final String title;
  final List<String> options;
  int? selectedOption;

  QuizQuestion({
    required this.number,
    required this.title,
    required this.options,
    this.selectedOption,
  });
}
