import 'package:flutter/material.dart';

class EnergizedLamp extends StatelessWidget {
  final bool isEnergized;
  final double size;
  final bool showLabel;
  final String? label;
  final String? tooltip;
  final VoidCallback? onTap;
  final double borderWidth;
  final Color borderColor;
  final double fontSize;

  const EnergizedLamp({
    super.key,
    required this.isEnergized,
    this.size = 30,
    this.showLabel = false,
    this.label,
    this.tooltip,
    this.onTap,
    this.borderWidth = 2,
    this.borderColor = Colors.white,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final Color lampColor = isEnergized ? Colors.greenAccent[700]! : Colors.redAccent[700]!;
    
    Widget lamp = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: lampColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor.withValues(alpha: 0.8),
          width: borderWidth,
        ),
        boxShadow: [
          // Внутреннее свечение
          BoxShadow(
            color: lampColor.withValues(alpha: 0.5),
            blurRadius: size * 0.2,
            spreadRadius: 1,
          ),
          //если лампа горит
          if (isEnergized)
            BoxShadow(
              color: lampColor.withValues(alpha: 0.3),
              blurRadius: size * 0.6,
              spreadRadius: size * 0.1,
            ),
        ],
      ),
      child: showLabel && label != null
          ? Center(
              child: Text(
                label!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  shadows: const [Shadow(blurRadius: 2, color: Colors.black)],
                ),
              ),
            )
          : null,
    );

    if (onTap != null) {
      lamp = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: lamp,
      );
    }
    if (tooltip != null && tooltip!.isNotEmpty) {
      return Tooltip(
        message: tooltip,
        textStyle: const TextStyle(
        color: Colors.white
        ),
        waitDuration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: const Color(0xFF303F46),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: lamp,
      );
    }
    return lamp;
  }
}