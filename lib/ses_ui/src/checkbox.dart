import 'package:flutter/material.dart';

class SESCheckbox extends StatelessWidget{

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  const SESCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: value ? Colors.orange.withValues(alpha: 0.1) : const Color(0xFF303F46),
              border: Border.all(
                color: value ? Colors.orange : Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: value
            ? const Icon(Icons.check, size: 16, color: Colors.orange,)
            : null,
          ),
          const SizedBox(width: 12),
          Text(
           label,
           style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
           ), 
          ),
        ],
      ),
    );
  }
}