import 'package:flutter/material.dart';
import 'package:widgets/ses_ui/ses_ui.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1C1E),
      ),
      home: const ControlPanel(),
    );
  }
}

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  double _val = 50.0;
  bool _isBusy = false;
  bool _autoReset = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView( 
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Тест виджетов",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                  const SizedBox(height: 40),

                  // Кнопка вызова оверлея
                  SESButton(
                    text: " Вызвать Initialization widget", 
                    onPressed: () => setState(() => _isBusy = true),
                  ),
                  
                  const SizedBox(height: 30),

                  // Слайдер
                  SESSlider(
                    label: "Значение слайдера",
                    value: _val, 
                    onChanged: (v) => setState(() => _val = v),
                  ),
                  
                  const SizedBox(height: 30),

                  // Переключатель режима
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SESToggleSwitch(),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Инпут (ввод кода)
                  SESInputBox(
                    label: "InputBox",
                    hint: "Введите что-нибудь",
                    onChanged: (text) => print("ввод: $text"),
                  ),

                  const SizedBox(height: 25),

                  // Чекбокс
                  SESCheckbox(
                    label: "Чекбокс",
                    value: _autoReset,
                    onChanged: (val) => setState(() => _autoReset = val),
                  ),
                ], // Закрываем список children тут
              ),
            ),
          ),

          // Оверлей (всегда в конце стека, чтобы быть поверх всех)
          InitializationOverlay(
            isVisible: _isBusy,
            customMessage: "здесь при вызове через custom message можно переписывать стартовый текст и использовать виджет не только при инициализации",
          ),
        ],
      ),
      
      // Кнопка для выхода из режима "Busy" (для теста)
      floatingActionButton: _isBusy 
        ? FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () => setState(() => _isBusy = false),
            child: const Icon(Icons.close, color: Colors.black),
          ) 
        : null,
    );
  }
}