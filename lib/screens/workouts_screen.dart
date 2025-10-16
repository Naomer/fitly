import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../models/workout.dart';
import '../widgets/workout_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/calendar_card.dart';
import '../widgets/add_workout_card.dart';
import 'workout_detail_screen.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Consumer<WorkoutProvider>(
          builder: (context, workoutProvider, child) {
            return CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Workouts',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2A2A2A),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.filter_list,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2A2A2A),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Content
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Top row - Workout cards
                      Row(
                        children: [
                          Expanded(
                            child: WorkoutCard(
                              workout: workoutProvider.workouts[0],
                              onTap: () => _navigateToWorkoutDetail(
                                context, 
                                workoutProvider.workouts[0],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatsCard(
                              title: 'Body weight',
                              value: '${workoutProvider.userStats?.bodyWeight.toInt() ?? 0} lbs',
                              subtitle: _formatTimeAgo(
                                workoutProvider.userStats?.lastWeightUpdate ?? DateTime.now(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Calendar card
                      CalendarCard(
                        workoutCalendar: workoutProvider.userStats?.workoutCalendar ?? {},
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Second workout card
                      WorkoutCard(
                        workout: workoutProvider.workouts[1],
                        onTap: () => _navigateToWorkoutDetail(
                          context, 
                          workoutProvider.workouts[1],
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Volume lifted card
                      StatsCard(
                        title: 'Volume lifted',
                        value: '${workoutProvider.userStats?.volumeLifted.toInt() ?? 0} lbs',
                        subtitle: workoutProvider.userStats?.period ?? '',
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Add workout card
                      const AddWorkoutCard(),
                      
                      const SizedBox(height: 100), // Space for bottom navigation
                    ]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToWorkoutDetail(BuildContext context, Workout workout) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutDetailScreen(workout: workout),
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    }
  }
}
