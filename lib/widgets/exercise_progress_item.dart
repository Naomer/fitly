import 'package:flutter/material.dart';
import '../models/workout.dart';

class ExerciseProgressItem extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const ExerciseProgressItem({
    super.key,
    required this.exercise,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData getExerciseIcon() {
      switch (exercise.type) {
        case ExerciseType.cardio:
          return exercise.isCompleted ? Icons.check_circle : Icons.timer;
        case ExerciseType.bodyweight:
          return Icons.fitness_center;
        case ExerciseType.time:
          return Icons.refresh;
        case ExerciseType.weight:
          return exercise.isCompleted ? Icons.check_circle : Icons.check_box_outline_blank;
      }
    }

    Color getIconColor() {
      if (exercise.isCompleted) {
        return const Color(0xFF00FF00);
      }
      switch (exercise.type) {
        case ExerciseType.cardio:
          return Colors.white;
        case ExerciseType.bodyweight:
          return Colors.white;
        case ExerciseType.time:
          return Colors.white;
        case ExerciseType.weight:
          return Colors.white;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Exercise icon
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: exercise.isCompleted 
                    ? const Color(0xFF00FF00).withOpacity(0.1)
                    : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                getExerciseIcon(),
                color: getIconColor(),
                size: 20,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Exercise info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: TextStyle(
                      color: exercise.isCompleted 
                          ? Colors.grey[400] 
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: exercise.isCompleted 
                          ? TextDecoration.lineThrough 
                          : null,
                    ),
                  ),
                  if (exercise.notes != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      exercise.notes!,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Menu dots
            const Icon(
              Icons.more_horiz,
              color: Colors.grey,
              size: 20,
            ),
            
            const SizedBox(width: 8),
            
            // Chevron
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
