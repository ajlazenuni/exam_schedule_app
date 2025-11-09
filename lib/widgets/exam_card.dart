import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: exam.isPast ? Colors.grey[300] : Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subject name
              Text(
                exam.subject,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: exam.isPast ? Colors.grey[700] : Colors.blue[900],
                  decoration: exam.isPast ? TextDecoration.lineThrough : null,
                ),
              ),
              const SizedBox(height: 12),

              // Date and time
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.blue[700],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    exam.formattedDate,
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPast ? Colors.grey[700] : Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.blue[700],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    exam.formattedTime,
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPast ? Colors.grey[700] : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Rooms
              Row(
                children: [
                  Icon(
                    Icons.meeting_room,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.blue[700],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(
                        fontSize: 16,
                        color: exam.isPast ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
