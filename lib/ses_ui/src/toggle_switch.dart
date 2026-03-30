import 'package:flutter/material.dart';

class SESToggleSwitch extends StatefulWidget {
  final String stateOneName;
  final String stateTwoName;
  final bool initialState;
  final ValueChanged<bool>? onChanged;

  const SESToggleSwitch({
    super.key,
    this.stateOneName = "МУ",
    this.stateTwoName = "ДУ",
    this.initialState = true,
    this.onChanged,
  });

  @override
  State<SESToggleSwitch> createState() => _SESToggleSwitchState();
}

class _SESToggleSwitchState extends State<SESToggleSwitch> {
  late bool _isStateOne;

  @override
  void initState() {
    super.initState();
    _isStateOne = widget.initialState;
  }

  void _handleTap() {
    setState(() => _isStateOne = !_isStateOne);
    widget.onChanged?.call(_isStateOne);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 50, 
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Label(text: widget.stateOneName, isActive: _isStateOne),
            const SizedBox(height: 8),
            _Label(text: widget.stateTwoName, isActive: !_isStateOne),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  final bool isActive;

  const _Label({required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Colors.orange;
    final Color inactiveColor = Colors.grey[600]!;

    return Stack(
      alignment: Alignment.center,
      children: [
        // свечение
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isActive ? 1.0 : 0.0,
          child: Container(
            width: 30,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: activeColor.withValues(alpha: 0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isActive ? activeColor : inactiveColor,
            shadows: isActive 
              ? [Shadow(color: activeColor.withValues(alpha: 0.8), blurRadius: 4)]
              : [],
          ),
          child: Text(text),
        ),
      ],
    );
  }
}