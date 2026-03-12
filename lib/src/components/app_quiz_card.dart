import 'package:dmtestes/src/components/app_option_selector.dart';
import 'package:dmtestes/src/components/app_quiz_question.dart';
import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';

class AppQuizCard extends StatefulWidget {
  final QuizQuestion question;
  final void Function(int) onSelectOption;
  final VoidCallback onSwipeLeft; //
  final VoidCallback onSwipeRight; // Anterior
  final bool canSwipeLeft;
  final bool canSwipeRight;

  const AppQuizCard({
    super.key,
    required this.question,
    required this.onSelectOption,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    this.canSwipeLeft = true,
    this.canSwipeRight = true,
  });

  @override
  State<AppQuizCard> createState() => _AppQuizCardState();
}

class _AppQuizCardState extends State<AppQuizCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;

  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;

  static const double _swipeThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _rotationAnimation = Tween<double>(begin: 0, end: 0).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 1, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    _isDragging = true;
    _controller.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;
    setState(() {
      _dragOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _isDragging = false;

    if (_dragOffset.dx < -_swipeThreshold && widget.canSwipeLeft) {
      //
      _animateOut(toLeft: true, onComplete: widget.onSwipeLeft);
    } else if (_dragOffset.dx > _swipeThreshold && widget.canSwipeRight) {
      //
      _animateOut(toLeft: false, onComplete: widget.onSwipeRight);
    } else {
      //
      _animateBack();
    }
  }

  void _animateOut({required bool toLeft, required VoidCallback onComplete}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final targetX = toLeft ? -screenWidth * 1.5 : screenWidth * 1.5;

    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset(targetX, _dragOffset.dy),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx * 0.001,
      end: (toLeft ? -1 : 1) * 0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward(from: 0).then((_) {
      onComplete();
      // Reset
      setState(() {
        _dragOffset = Offset.zero;
      });
      _controller.reset();
      _opacityAnimation = Tween<double>(begin: 1, end: 1).animate(_controller);
    });
  }

  void _animateBack() {
    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx * 0.001,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward(from: 0).then((_) {
      setState(() {
        _dragOffset = Offset.zero;
      });
      _controller.reset();
    });
  }

  double get _currentRotation {
    if (_isDragging) return _dragOffset.dx * 0.001;
    return _rotationAnimation.value;
  }

  Offset get _currentOffset {
    if (_isDragging) return _dragOffset;
    return _slideAnimation.value;
  }

  double get _currentOpacity {
    if (_isDragging) return 1.0;
    return _opacityAnimation.value;
  }

  @override
  Widget build(BuildContext context) {
    final labels = ['A', 'B', 'C', 'D', 'E'];
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _currentOffset,
          child: Transform.rotate(
            angle: _currentRotation,
            child: Opacity(
              opacity: _currentOpacity.clamp(0.0, 1.0),
              child: child,
            ),
          ),
        );
      },
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: DmColor.gray200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: DmColor.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
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
                  '${widget.question.number} – ${widget.question.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: DmColor.gray950,
                    height: 1.4,
                  ),
                ),
              ),
              ...List.generate(widget.question.options.length, (index) {
                final letter = labels[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AppOptionSelector(
                    label: '$letter) ${widget.question.options[index]}',
                    isSelected: widget.question.selectedOption == index,
                    onTap: () => widget.onSelectOption(index),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
