import 'package:flutter/material.dart';

 class SESButton extends StatelessWidget{
  final String text;
  final VoidCallback? onPressed;
  final String sesHint;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final double minWidth; 
  final double minHeight;
  final bool isEnabled;
  final double borderRadius;
  
  const SESButton({
    super.key,
    required this.text,
    this.onPressed,
    this.sesHint = '',
    this.backgroundColor = const Color(0xFF303F46),
    this.borderColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 15,
    this.minWidth = 120,
    this.minHeight = 50,
    this.isEnabled = true,
    this.borderRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
   final bool isButtonActive = isEnabled && onPressed != null;
   final double opacity = isButtonActive ? 1.0 : 0.5;
   Widget button = ElevatedButton(
    onPressed: isButtonActive ? onPressed : null, 
    style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor.withValues(alpha: opacity),
        foregroundColor: textColor,
        disabledBackgroundColor: backgroundColor.withValues(alpha: 0.5),
        side: BorderSide(
          color: borderColor.withValues(alpha: opacity),
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize:  Size(minWidth, minHeight),
        padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
    child: Text(
      text,
      textAlign: TextAlign.center,
      softWrap: false,
     ),
    );

    if (sesHint.isEmpty) return button;
    return Tooltip(
      message: sesHint,
      textStyle: const TextStyle(
        color: Colors.white
      ),
      waitDuration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: const Color(0xE6303F46),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue, width: 1)
      ),
      child: button,
    );
  }
 }