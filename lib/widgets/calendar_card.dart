import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCard extends StatelessWidget {
  final Map<DateTime, bool> workoutCalendar;

  const CalendarCard({
    super.key,
    required this.workoutCalendar,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = [
      now.subtract(const Duration(days: 60)),
      now.subtract(const Duration(days: 30)),
      now,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month headers
          Row(
            children: months.map((month) {
              return Expanded(
                child: Text(
                  DateFormat('MMM').format(month),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 12),
          
          // Calendar grid
          Row(
            children: months.map((month) {
              return Expanded(
                child: _buildMonthGrid(month),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 16),
          
          // Workout info
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2A2A2A), width: 2),
                ),
                child: const Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Back + bicep + legs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mondays',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthGrid(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDay.day;
    final startWeekday = firstDay.weekday;
    
    final List<Widget> dayWidgets = [];
    
    // Add empty cells for days before the first day of the month
    for (int i = 1; i < startWeekday; i++) {
      dayWidgets.add(const SizedBox(height: 8, width: 8));
    }
    
    // Add day cells
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(month.year, month.month, day);
      final hasWorkout = workoutCalendar[date] ?? false;
      
      dayWidgets.add(
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: hasWorkout ? Colors.white : const Color(0xFF2A2A2A),
            shape: BoxShape.circle,
          ),
        ),
      );
    }
    
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: dayWidgets,
    );
  }
}
