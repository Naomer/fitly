import 'package:flutter/material.dart';
import '../models/workout.dart';

class MuscleGroupCard extends StatelessWidget {
  final MuscleGroup muscleGroup;

  const MuscleGroupCard({super.key, required this.muscleGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('💪', style: TextStyle(fontSize: 14)),
            ),
          ),

          const SizedBox(height: 8),

          // Name
          Text(
            muscleGroup.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // Status
          Row(
            children: [
              const Icon(Icons.trending_up, color: Color(0xFF00FF00), size: 10),
              const SizedBox(width: 2),
              const Text(
                'Growing',
                style: TextStyle(color: Color(0xFF00FF00), fontSize: 10),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Progress dots
          Row(
            children: List.generate(5, (index) {
              return Container(
                width: 3,
                height: 3,
                margin: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  color: index < (muscleGroup.progress * 5).round()
                      ? Colors.white
                      : const Color(0xFF2A2A2A),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),

          const Spacer(),

          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${muscleGroup.currentReps}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              Text(
                '+${muscleGroup.targetIncrease}',
                style: const TextStyle(color: Color(0xFF00FF00), fontSize: 10),
              ),
              Text(
                '${muscleGroup.totalReps}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
