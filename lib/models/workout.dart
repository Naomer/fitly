class Workout {
  final String id;
  final String name;
  final String day;
  final int duration; // in minutes
  final List<Exercise> exercises;
  final String type; // e.g., "Push day", "Cardio"

  Workout({
    required this.id,
    required this.name,
    required this.day,
    required this.duration,
    required this.exercises,
    required this.type,
  });
}

class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final double weight; // in kg
  final String? notes;
  final bool isCompleted;
  final ExerciseType type;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
    this.notes,
    this.isCompleted = false,
    this.type = ExerciseType.weight,
  });
}

enum ExerciseType {
  weight,
  cardio,
  bodyweight,
  time,
}

class MuscleGroup {
  final String name;
  final String icon;
  final String status; // "Growing", "Maintaining", etc.
  final int currentReps;
  final int targetIncrease;
  final int totalReps;
  final double progress; // 0.0 to 1.0

  MuscleGroup({
    required this.name,
    required this.icon,
    required this.status,
    required this.currentReps,
    required this.targetIncrease,
    required this.totalReps,
    required this.progress,
  });
}

class UserStats {
  final double bodyWeight; // in lbs
  final DateTime lastWeightUpdate;
  final double volumeLifted; // in lbs
  final String period; // "Last 7 days", etc.
  final Map<DateTime, bool> workoutCalendar; // dates with workouts

  UserStats({
    required this.bodyWeight,
    required this.lastWeightUpdate,
    required this.volumeLifted,
    required this.period,
    required this.workoutCalendar,
  });
}
