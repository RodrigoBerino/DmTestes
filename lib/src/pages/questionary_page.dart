import 'package:dmtestes/src/components/app_option_selector.dart';
import 'package:dmtestes/src/components/app_quiz_question.dart';
import 'package:dmtestes/src/components/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:dmtestes/src/components/app_header.dart';
import 'package:dmtestes/src/core/app_color.dart';
import '../components/app_answer_card.dart';
import '../components/app_progress_bar.dart';
import '../components/app_question_card.dart';

class QuestionaryPage extends StatefulWidget {
  const QuestionaryPage({super.key});

  @override
  State<QuestionaryPage> createState() => _QuestionaryPageState();
}

class _QuestionaryPageState extends State<QuestionaryPage>
    with TickerProviderStateMixin {
  final QuizViewModel _viewModel = QuizViewModel();
  late AnimationController _swipeController;
  late AnimationController _enterController;

  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;
  bool _isAnimating = false;
  bool _isFinished = false;

  static const double _swipeThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _swipeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _enterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    // Entrada inicial
    _enterController.forward();
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _enterController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    if (_isAnimating) return;
    _isDragging = true;
    _swipeController.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!_isDragging || _isAnimating) return;
    setState(() {
      _dragOffset += Offset(details.delta.dx, 0); // só horizontal
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (!_isDragging || _isAnimating) return;
    _isDragging = false;

    if (_dragOffset.dx < -_swipeThreshold && _viewModel.canGoForward) {
      _animateSwipeOut(toLeft: true, onComplete: () => _goNext());
    } else if (_dragOffset.dx > _swipeThreshold && _viewModel.canGoBack) {
      _animateSwipeOut(toLeft: false, onComplete: () => _goPrevious());
    } else {
      _animateBack();
    }
  }

  void _animateSwipeOut({
    required bool toLeft,
    required VoidCallback onComplete,
  }) {
    _isAnimating = true;
    final screenWidth = MediaQuery.of(context).size.width;
    final startOffset = _dragOffset;
    final endX = toLeft ? -screenWidth * 1.5 : screenWidth * 1.5;

    _swipeController.reset();
    _swipeController.forward().then((_) {
      onComplete();
      _dragOffset = Offset.zero;
      _isAnimating = false;
      // Animar entrada do próximo card
      _enterController.reset();
      _enterController.forward();
      setState(() {});
    });

    _swipeController.addListener(() {
      if (!_isAnimating) return;
      final t = Curves.easeIn.transform(_swipeController.value);
      setState(() {
        _dragOffset = Offset(
          startOffset.dx + (endX - startOffset.dx) * t,
          startOffset.dy * (1 - t),
        );
      });
    });
  }

  void _animateBack() {
    _isAnimating = true;
    final startOffset = _dragOffset;

    _swipeController.reset();
    _swipeController.addListener(() {
      if (!_isAnimating) return;
      final t = Curves.elasticOut.transform(_swipeController.value);
      setState(() {
        _dragOffset = Offset(
          startOffset.dx * (1 - t),
          startOffset.dy * (1 - t),
        );
      });
    });

    _swipeController.forward().then((_) {
      _dragOffset = Offset.zero;
      _isAnimating = false;
      setState(() {});
    });
  }

  void _goNext() {
    setState(() {
      _viewModel.goToNext();
    });
  }

  void _goPrevious() {
    setState(() {
      _viewModel.goToPrevious();
    });
  }

  void _onNextPressed() {
    if (_isAnimating) return;
    if (_viewModel.isLastQuestion) {
      _viewModel.finishQuiz();
      _animateSwipeOut(
        toLeft: true,
        onComplete: () {
          //
          setState(() {
            _isFinished = true; //
          });
          _enterController.reset();
          _enterController.forward(); //
        },
      );
      return;
    }
    _animateSwipeOut(toLeft: true, onComplete: () => _goNext());
  }

  void _onPreviousPressed() {
    if (_isAnimating || !_viewModel.canGoBack) return;
    _animateSwipeOut(toLeft: false, onComplete: () => _goPrevious());
  }

  void _onContinuePressed() {
    Navigator.of(context).maybePop();
  }

  Widget _buildCompletionCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: DmColor.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: DmColor.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: DmColor.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Parabéns!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: DmColor.gray950,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Você concluiu o treinamento com\nsucesso!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: DmColor.gray500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          //check verde
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: DmColor.apple600,
            ),
            child: const Icon(Icons.check, color: DmColor.white, size: 44),
          ),
          const SizedBox(height: 36),
          //  Continuar
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _onContinuePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: DmColor.apple600,
                foregroundColor: DmColor.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _viewModel.currentQuestion;
    final labels = ['A', 'B', 'C', 'D', 'E'];

    //
    final rotation = _dragOffset.dx * 0.0008;
    final opacity = (1.0 - (_dragOffset.dx.abs() / 500)).clamp(0.4, 1.0);

    //
    /* final enterSlide = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _enterController, curve: Curves.easeOut));

    final enterOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _enterController, curve: Curves.easeOut)); */

    return Scaffold(
      backgroundColor: DmColor.gray100,

      body: Column(
        children: [
          AppHeader(label: 'Prova de retenção', icon: Icons.arrow_back),
          AppProgressBar(
            currentQuestion: _isFinished
                ? _viewModel
                      .totalQuestions //
                : _viewModel.currentIndex + 1,
            totalQuestion: _viewModel.totalQuestions,
            progress: _isFinished ? 1.0 : _viewModel.progress,
          ),

          Expanded(
            child: Center(
              child: _isFinished
                  ? AnimatedBuilder(
                      animation: _enterController,
                      builder: (context, child) {
                        final t = CurvedAnimation(
                          parent: _enterController,
                          curve: Curves.easeOut,
                        ).value;
                        return Opacity(
                          opacity: t.clamp(0.0, 1.0),
                          child: Transform.scale(
                            scale: 0.9 + (0.1 * t),
                            child: child,
                          ),
                        );
                      },
                      child: _buildCompletionCard(),
                    )
                  : GestureDetector(
                      onHorizontalDragStart: _onPanStart,
                      onHorizontalDragUpdate: _onPanUpdate,
                      onHorizontalDragEnd: _onPanEnd,
                      child: AnimatedBuilder(
                        animation: _enterController,
                        builder: (context, child) {
                          final isEntering =
                              _enterController.isAnimating &&
                              _dragOffset == Offset.zero &&
                              !_isAnimating;

                          final enterSlide =
                              Tween<Offset>(
                                begin: const Offset(0.3, 0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: _enterController,
                                  curve: Curves.easeOut,
                                ),
                              );

                          final enterOpacity =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _enterController,
                                  curve: Curves.easeOut,
                                ),
                              );

                          final finalOffset = isEntering
                              ? Offset(
                                  enterSlide.value.dx *
                                      MediaQuery.of(context).size.width *
                                      0.5,
                                  0,
                                )
                              : _dragOffset;

                          final finalOpacity = isEntering
                              ? enterOpacity.value.clamp(0.0, 1.0)
                              : opacity;

                          final finalRotation = isEntering ? 0.0 : rotation;

                          return Transform.translate(
                            offset: finalOffset,
                            child: Transform.rotate(
                              angle: finalRotation,
                              child: Opacity(
                                opacity: finalOpacity,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: _buildQuestionCard(question, labels),
                      ),
                    ),
            ),
          ),

          if (!_isFinished)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              child: Row(
                children: [
                  //  Anterior
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: _viewModel.canGoBack
                            ? _onPreviousPressed
                            : null,
                        icon: const Icon(Icons.arrow_back, size: 18),
                        label: const Text(
                          'Anterior',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: DmColor.gray700,
                          side: BorderSide(
                            color: _viewModel.canGoBack
                                ? DmColor.gray300
                                : DmColor.gray200,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          disabledForegroundColor: DmColor.gray300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  //  Próxima
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _onNextPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DmColor.apple600,
                          foregroundColor: DmColor.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _viewModel.isLastQuestion
                                  ? 'Finalizar'
                                  : 'Próxima',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              _viewModel.isLastQuestion
                                  ? Icons.check
                                  : Icons.arrow_forward,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuizQuestion question, List<String> labels) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DmColor.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: DmColor.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: DmColor.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Título
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              '${question.number} – ${question.title}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: DmColor.gray950,
                height: 1.4,
              ),
            ),
          ),
          // Opções
          ...List.generate(question.options.length, (index) {
            final letter = labels[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < question.options.length - 1 ? 10 : 0,
              ),
              child: AppOptionSelector(
                label: '$letter) ${question.options[index]}',
                isSelected: question.selectedOption == index,
                onTap: () {
                  setState(() {
                    _viewModel.selectOption(index);
                  });
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

//
class AnimatedBuilder extends AnimatedWidget {
  final Widget? child;
  final Widget Function(BuildContext, Widget?) builder;

  const AnimatedBuilder({
    super.key,
    required Animation<double> animation,
    required this.builder,
    this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}
