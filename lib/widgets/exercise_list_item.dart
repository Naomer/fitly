import 'package:flutter/material.dart';
import '../models/workout.dart';

class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseListItem({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Exercise name
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
          
          // Weight increase indicator (if applicable)
          if (exercise.weight > 0 && !exercise.isCompleted)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00FF00).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.trending_up,
                    color: Color(0xFF00FF00),
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '2.5 kg',
                    style: const TextStyle(
                      color: Color(0xFF00FF00),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          
          const SizedBox(width: 12),
          
          // Sets info
          Text(
            '${exercise.sets} sets',
            style: TextStyle(
              color: exercise.isCompleted 
                  ? Colors.grey[400] 
                  : Colors.grey[300],
              fontSize: 14,
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Menu dots
          const Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }
}
