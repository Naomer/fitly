import 'package:flutter_test/flutter_test.dart';
import 'package:fitly/models/workout.dart';

void main() {
  group('Workout Model Tests', () {
    test('Workout model creates correctly', () {
      final workout = Workout(
        id: '1',
        name: 'Test Workout',
        day: 'Monday',
        duration: 60,
        type: 'Push day',
        exercises: [],
      );

      expect(workout.id, '1');
      expect(workout.name, 'Test Workout');
      expect(workout.day, 'Monday');
      expect(workout.duration, 60);
      expect(workout.type, 'Push day');
      expect(workout.exercises, isEmpty);
    });

    test('Exercise model creates correctly', () {
      final exercise = Exercise(
        id: '1',
        name: 'Bench Press',
        sets: 3,
        reps: 10,
        weight: 80.0,
        notes: 'Test notes',
        isCompleted: false,
        type: ExerciseType.weight,
      );

      expect(exercise.id, '1');
      expect(exercise.name, 'Bench Press');
      expect(exercise.sets, 3);
      expect(exercise.reps, 10);
      expect(exercise.weight, 80.0);
      expect(exercise.notes, 'Test notes');
      expect(exercise.isCompleted, false);
      expect(exercise.type, ExerciseType.weight);
    });

    test('MuscleGroup model creates correctly', () {
      final muscleGroup = MuscleGroup(
        name: 'Chest',
        icon: '💪',
        status: 'Growing',
        currentReps: 0,
        targetIncrease: 6,
        totalReps: 18,
        progress: 0.5,
      );

      expect(muscleGroup.name, 'Chest');
      expect(muscleGroup.icon, '💪');
      expect(muscleGroup.status, 'Growing');
      expect(muscleGroup.currentReps, 0);
      expect(muscleGroup.targetIncrease, 6);
      expect(muscleGroup.totalReps, 18);
      expect(muscleGroup.progress, 0.5);
    });

    test('UserStats model creates correctly', () {
      final now = DateTime.now();
      final userStats = UserStats(
        bodyWeight: 190.0,
        lastWeightUpdate: now,
        volumeLifted: 3200.0,
        period: 'Last 7 days',
        workoutCalendar: {now: true},
      );

      expect(userStats.bodyWeight, 190.0);
      expect(userStats.lastWeightUpdate, now);
      expect(userStats.volumeLifted, 3200.0);
      expect(userStats.period, 'Last 7 days');
      expect(userStats.workoutCalendar[now], true);
    });
  });
}
