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
        width: 40,
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Label(text: widget.stateOneName, isActive: _isStateOne),
            const SizedBox(height: 4),
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
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: isActive ? Colors.orange : Colors.grey[400],
      ),
      child: Text(text),
    );
  }
}