import 'package:flutter/foundation.dart';
import '../components/app_quiz_question.dart';

class QuizViewModel extends ChangeNotifier {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      number: 1,
      title: 'Qual é a missão principal da empresa?',
      options: [
        'Gerar lucro a qualquer custo',
        'Promover o bem-estar social',
        'Desenvolver soluções inovadoras',
        'Manter tradições antigas',
        'Expandir globalmente',
      ],
    ),
    QuizQuestion(
      number: 2,
      title: 'Qual é o principal diferencial competitivo da empresa?',
      options: [
        'Preço baixo',
        'Atendimento ao cliente',
        'Tecnologia de ponta',
        'Localização estratégica',
        'Marca reconhecida',
      ],
    ),
    QuizQuestion(
      number: 3,
      title: 'Como a empresa promove a cultura organizacional?',
      options: [
        'Reuniões semanais obrigatórias',
        'Eventos de integração',
        'Comunicação transparente',
        'Bonificações financeiras',
        'Hierarquia rígida',
      ],
    ),
    QuizQuestion(
      number: 4,
      title: 'Qual dos seguintes valores é fundamental para a empresa?',
      options: [
        'Inovação contínua',
        'Maximização do lucro',
        'Estagnação',
        'Conformidade rígida',
        'Desenvolvimento sustentável',
      ],
    ),
    QuizQuestion(
      number: 5,
      title: 'O que a empresa espera de seus colaboradores?',
      options: [
        'Obediência cega',
        'Proatividade e criatividade',
        'Trabalho isolado',
        'Foco apenas em metas',
        'Conformismo',
      ],
    ),
    QuizQuestion(
      number: 6,
      title: 'Qual é a visão de futuro da empresa?',
      options: [
        'Ser líder de mercado local',
        'Tornar-se referência global',
        'Manter o status atual',
        'Reduzir operações',
        'Focar apenas no Brasil',
      ],
    ),
    QuizQuestion(
      number: 7,
      title: 'Como a empresa lida com feedback dos clientes?',
      options: [
        'Ignora reclamações',
        'Analisa e implementa melhorias',
        'Responde apenas nas redes sociais',
        'Delega para terceiros',
        'Não possui canal de atendimento',
      ],
    ),
    QuizQuestion(
      number: 8,
      title: 'Qual prática a empresa adota para sustentabilidade?',
      options: [
        'Nenhuma ação específica',
        'Reciclagem de materiais',
        'Redução de emissão de carbono',
        'Programas de reflorestamento',
        'Todas as anteriores',
      ],
    ),
    QuizQuestion(
      number: 9,
      title: 'Como funciona o plano de carreira na empresa?',
      options: [
        'Não existe plano de carreira',
        'Promoção por tempo de casa',
        'Avaliação por desempenho',
        'Indicação da diretoria',
        'Processo seletivo interno',
      ],
    ),
    QuizQuestion(
      number: 10,
      title: 'Qual é o principal canal de comunicação interna?',
      options: [
        'E-mail corporativo',
        'Aplicativo interno',
        'Murais físicos',
        'Reuniões presenciais',
        'Grupos de WhatsApp',
      ],
    ),
  ];

  int _currentIndex = 0;

  //
  SwipeDirection _lastSwipeDirection = SwipeDirection.none;

  List<QuizQuestion> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get totalQuestions => _questions.length;
  QuizQuestion get currentQuestion => _questions[_currentIndex];
  double get progress => (_currentIndex + 1) / _totalQuestions;
  int get _totalQuestions => _questions.length;
  SwipeDirection get lastSwipeDirection => _lastSwipeDirection;

  bool get canGoBack => _currentIndex > 0;
  bool get canGoForward => _currentIndex < _totalQuestions - 1;
  bool get isLastQuestion => _currentIndex == _totalQuestions - 1;

  void selectOption(int optionIndex) {
    _questions[_currentIndex].selectedOption = optionIndex;
    notifyListeners();
  }

  bool goToNext() {
    if (canGoForward) {
      _lastSwipeDirection = SwipeDirection.left;
      _currentIndex++;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool goToPrevious() {
    if (canGoBack) {
      _lastSwipeDirection = SwipeDirection.right;
      _currentIndex--;
      notifyListeners();
      return true;
    }
    return false;
  }

  void finishQuiz() {}
}

enum SwipeDirection { left, right, none }
