import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Hardcoded list of exams
  List<Exam> _getExams() {
    final exams = [
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 1, 15, 10, 0),
        rooms: ['Амфитеатар 2', 'Лабораторија 1'],
      ),
      Exam(
        subject: 'Вештачка интелигенција',
        dateTime: DateTime(2025, 1, 18, 14, 0),
        rooms: ['Амфитеатар 1'],
      ),
      Exam(
        subject: 'Компјутерски мрежи',
        dateTime: DateTime(2025, 1, 22, 9, 0),
        rooms: ['Лабораторија 3', 'Лабораторија 4'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(2025, 1, 25, 11, 0),
        rooms: ['Амфитеатар 2'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(2025, 1, 29, 13, 0),
        rooms: ['Лабораторија 2', 'Лабораторија 5'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateTime: DateTime(2025, 2, 3, 10, 30),
        rooms: ['Амфитеатар 3', 'Лабораторија 1'],
      ),
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateTime: DateTime(2025, 2, 7, 15, 0),
        rooms: ['Амфитеатар 1', 'Амфитеатар 2'],
      ),
      Exam(
        subject: 'Софтверско инженерство',
        dateTime: DateTime(2025, 2, 10, 12, 0),
        rooms: ['Лабораторија 3'],
      ),
      Exam(
        subject: 'Машинско учење',
        dateTime: DateTime(2025, 2, 14, 9, 30),
        rooms: ['Амфитеатар 2', 'Лабораторија 4'],
      ),
      Exam(
        subject: 'Дискретна математика',
        dateTime: DateTime(2025, 2, 18, 11, 30),
        rooms: ['Амфитеатар 1'],
      ),
      Exam(
        subject: 'Објектно ориентирано програмирање',
        dateTime: DateTime(2024, 11, 5, 10, 0),
        rooms: ['Лабораторија 2'],
      ),
      Exam(
        subject: 'Статистика',
        dateTime: DateTime(2024, 11, 8, 14, 0),
        rooms: ['Амфитеатар 3'],
      ),
    ];

    // Sort exams chronologically
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return exams;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _getExams();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Распоред за испити - 223199',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          // Badge showing total number of exams
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[900],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'Вкупно испити: ${exams.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
