// ignore_for_file: avoid_print

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
  bool _g1Enabled = true;
  bool _g2Enabled = false;

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
                    "Виджеты",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                  const SizedBox(height: 40),

                  // лампочки
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EnergizedLamp(
                        isEnergized: _g1Enabled,
                        label: "G1",
                        showLabel: true,
                        tooltip: "Генератор №1: ${_g1Enabled ? 'ПОД НАПРЯЖЕНИЕМ' : 'ОБЕСТОЧЕН'}",
                        onTap: () => setState(() => _g1Enabled = !_g1Enabled),
                      ),
                      const SizedBox(width: 40),
                      EnergizedLamp(
                        isEnergized: _g2Enabled,
                        label: "G2",
                        showLabel: true,
                        tooltip: "Генератор №2: ${_g2Enabled ? 'ПОД НАПРЯЖЕНИЕМ' : 'ОБЕСТОЧЕН'}",
                        onTap: () => setState(() => _g2Enabled = !_g2Enabled),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Кнопка вызова оверлея
                  SESButton(
                    text: "Вызвать Initialization widget", 
                    onPressed: () => setState(() => _isBusy = true),
                    sesHint: "можно добавить описание что делает конкретная кнопка",
                  ),
                  const SizedBox(height: 30),
                  // Слайдер
                  SESSlider(
                    label: "Значение слайдера",
                    value: _val, 
                    onChanged: (v) => setState(() => _val = v),
                  ),
                  const SizedBox(height: 30),
                  SESToggleSwitch(),
                  const SizedBox(height: 30),
                  // Инпут
                  SESInputBox(
                    label: "InputBox",
                    hint: "Введите что-нибудь...",
                  ),
                  const SizedBox(height: 25),
                  // Чекбокс
                  SESCheckbox(
                    label: "Чекбокс",
                    value: _autoReset,
                    onChanged: (val) => setState(() => _autoReset = val),
                  ),
                ], 
              ),
            ),
          ),
          InitializationOverlay(
            isVisible: _isBusy,
            customMessage: "здесь при вызове через custom message можно переписывать стартовый текст и использовать виджет не только при инициализации",
          ),
        ],
      ),
      
      // Кнопка для выхода из режима "Busy"
      floatingActionButton: _isBusy 
        ? FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () => setState(() => _isBusy = false),
            child: const Icon(Icons.close, color: Colors.black),
          ) 
        : null,
    );
  }
}