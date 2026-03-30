import 'package:flutter/material.dart';

class InitializationOverlay extends StatelessWidget {
  final bool isVisible;
  final bool isRefreshing;
  final double scale;
  final String? customMessage;

  const InitializationOverlay({
    super.key,
    required this.isVisible,
    this.isRefreshing = false,
    this.scale = 1.0,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final Color primaryColor = const Color(0xFF303F46);

    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.8),
        child: Center(
          child: Container(
            width: 300 * scale,
            padding: EdgeInsets.all(20 * scale),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10 * scale),
              border: Border.all(color: Colors.blue, width: 2 * scale),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 10 * scale,
                  spreadRadius: 2 * scale,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3 * scale,
                ),
                SizedBox(height: 20 * scale),
                _buildText(
                  customMessage ?? 'Инициализация системы...',
                  fontSize: 16 * scale,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10 * scale),
                _buildText(
                  'Пожалуйста, подождите.\nЗагружаются данные датчиков...',
                  fontSize: 12 * scale,
                  color: Colors.grey,
                ),
                if (isRefreshing) ...[
                  SizedBox(height: 10 * scale),
                  _buildText(
                    'Обновление данных...',
                    fontSize: 12 * scale,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, {
    required double fontSize,
    Color color = Colors.white,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}