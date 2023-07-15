import 'package:flutter/material.dart';

import '../viewmodel/home_viemodel.dart';
import '../viewmodel/navbar_viewmodel.dart';
import 'navbar_view.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigationBarViewModel _navBarViewModel = NavigationBarViewModel();

  HomeView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: viewModel.shouldShowCoursesMenu(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final shouldShowCoursesMenu = snapshot.data ?? false;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              leading: null,
              actions: null,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.navigateToEvent();
                            },
                            child: const Icon(
                              Icons.event,
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Event',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.navigateToMembers();
                            },
                            child: const Icon(
                              Icons.people,
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Members',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (shouldShowCoursesMenu) ...[
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateToCourses();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.book,
                            size: 50,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Courses',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToStructure();
                        },
                        child: const Icon(
                          Icons.group,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Structure',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                  ],
                ),
                
            bottomNavigationBar: NavBarView(
              viewModel: _navBarViewModel,
            ),
          );
        }
      },
    );
  }
}
