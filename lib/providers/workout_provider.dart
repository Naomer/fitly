import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  List<MuscleGroup> _muscleGroups = [];
  UserStats? _userStats;
  Workout? _currentWorkout;
  bool _isWorkoutInProgress = false;
  Duration _workoutDuration = Duration.zero;

  List<Workout> get workouts => _workouts;
  List<MuscleGroup> get muscleGroups => _muscleGroups;
  UserStats? get userStats => _userStats;
  Workout? get currentWorkout => _currentWorkout;
  bool get isWorkoutInProgress => _isWorkoutInProgress;
  Duration get workoutDuration => _workoutDuration;

  WorkoutProvider() {
    _initializeData();
  }

  void _initializeData() {
    // Initialize sample workouts
    _workouts = [
      Workout(
        id: '1',
        name: 'Chest + tricep',
        day: 'Fridays',
        duration: 60,
        type: 'Push day',
        exercises: [
          Exercise(
            id: '1',
            name: 'Barbell Bench Press',
            sets: 5,
            reps: 8,
            weight: 80.0,
          ),
          Exercise(
            id: '2',
            name: 'Barbell Military Press',
            sets: 3,
            reps: 10,
            weight: 50.0,
          ),
          Exercise(
            id: '3',
            name: 'Dumbbell Incline Press',
            sets: 3,
            reps: 12,
            weight: 30.0,
          ),
          Exercise(
            id: '4',
            name: 'Dumbbell Lateral Raises',
            sets: 3,
            reps: 15,
            weight: 12.5,
          ),
          Exercise(
            id: '5',
            name: 'Dumbbell Tricep Extensions',
            sets: 3,
            reps: 12,
            weight: 20.0,
          ),
        ],
      ),
      Workout(
        id: '2',
        name: 'Back + bicep + legs',
        day: 'Mondays',
        duration: 75,
        type: 'Pull day',
        exercises: [
          Exercise(
            id: '6',
            name: 'Deadlifts',
            sets: 5,
            reps: 5,
            weight: 120.0,
          ),
          Exercise(
            id: '7',
            name: 'Pull-ups',
            sets: 4,
            reps: 8,
            weight: 0.0,
            type: ExerciseType.bodyweight,
          ),
          Exercise(
            id: '8',
            name: 'Barbell Rows',
            sets: 4,
            reps: 10,
            weight: 70.0,
          ),
        ],
      ),
      Workout(
        id: '3',
        name: 'Cardio',
        day: 'Wednesdays',
        duration: 45,
        type: 'Cardio',
        exercises: [
          Exercise(
            id: '9',
            name: 'Treadmill',
            sets: 1,
            reps: 1,
            weight: 0.0,
            type: ExerciseType.cardio,
            notes: '5 km • 5:40 min/km',
            isCompleted: true,
          ),
          Exercise(
            id: '10',
            name: 'Chins',
            sets: 4,
            reps: 8,
            weight: 0.0,
            type: ExerciseType.bodyweight,
            notes: '1 of 4 sets completed',
          ),
          Exercise(
            id: '11',
            name: 'Planks',
            sets: 3,
            reps: 1,
            weight: 0.0,
            type: ExerciseType.time,
            notes: '3 x 30 sec',
          ),
          Exercise(
            id: '12',
            name: 'Bicep curls',
            sets: 3,
            reps: 12,
            weight: 15.0,
            notes: 'Check off when done',
          ),
          Exercise(
            id: '13',
            name: 'Bike',
            sets: 1,
            reps: 1,
            weight: 0.0,
            type: ExerciseType.cardio,
            notes: '10 min',
          ),
        ],
      ),
    ];

    // Initialize muscle groups
    _muscleGroups = [
      MuscleGroup(
        name: 'Front delts',
        icon: '💪',
        status: 'Growing',
        currentReps: 0,
        targetIncrease: 6,
        totalReps: 18,
        progress: 0.3,
      ),
      MuscleGroup(
        name: 'Chest',
        icon: '🏋️',
        status: 'Growing',
        currentReps: 0,
        targetIncrease: 6,
        totalReps: 18,
        progress: 0.4,
      ),
      MuscleGroup(
        name: 'Side delts',
        icon: '💪',
        status: 'Growing',
        currentReps: 0,
        targetIncrease: 6,
        totalReps: 18,
        progress: 0.2,
      ),
    ];

    // Initialize user stats
    _userStats = UserStats(
      bodyWeight: 190.0,
      lastWeightUpdate: DateTime.now().subtract(const Duration(minutes: 31)),
      volumeLifted: 3200.0,
      period: 'Last 7 days',
      workoutCalendar: _generateWorkoutCalendar(),
    );

    notifyListeners();
  }

  Map<DateTime, bool> _generateWorkoutCalendar() {
    final calendar = <DateTime, bool>{};
    final now = DateTime.now();
    
    // Generate calendar for the last 3 months
    for (int month = 0; month < 3; month++) {
      final date = DateTime(now.year, now.month - month, 1);
      final daysInMonth = DateTime(date.year, date.month + 1, 0).day;
      
      for (int day = 1; day <= daysInMonth; day++) {
        final currentDate = DateTime(date.year, date.month, day);
        // Randomly mark some days as workout days
        calendar[currentDate] = (day % 3 == 0 || day % 7 == 0) && 
                               currentDate.isBefore(now);
      }
    }
    
    return calendar;
  }

  void startWorkout(Workout workout) {
    _currentWorkout = workout;
    _isWorkoutInProgress = true;
    _workoutDuration = Duration.zero;
    notifyListeners();
  }

  void finishWorkout() {
    _currentWorkout = null;
    _isWorkoutInProgress = false;
    _workoutDuration = Duration.zero;
    notifyListeners();
  }

  void updateWorkoutDuration(Duration duration) {
    _workoutDuration = duration;
    notifyListeners();
  }

  void toggleExerciseCompletion(String exerciseId) {
    if (_currentWorkout != null) {
      final exerciseIndex = _currentWorkout!.exercises.indexWhere(
        (exercise) => exercise.id == exerciseId,
      );
      
      if (exerciseIndex != -1) {
        _currentWorkout!.exercises[exerciseIndex] = Exercise(
          id: _currentWorkout!.exercises[exerciseIndex].id,
          name: _currentWorkout!.exercises[exerciseIndex].name,
          sets: _currentWorkout!.exercises[exerciseIndex].sets,
          reps: _currentWorkout!.exercises[exerciseIndex].reps,
          weight: _currentWorkout!.exercises[exerciseIndex].weight,
          notes: _currentWorkout!.exercises[exerciseIndex].notes,
          type: _currentWorkout!.exercises[exerciseIndex].type,
          isCompleted: !_currentWorkout!.exercises[exerciseIndex].isCompleted,
        );
        notifyListeners();
      }
    }
  }
}
