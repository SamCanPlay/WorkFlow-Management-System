import 'package:go_router/go_router.dart';
import 'layout/app_shell.dart';
import 'pages/dashboard_page.dart';
import 'pages/projects_page.dart';
import 'pages/project_details_page.dart';

final appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: '/projects/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ProjectDetailsPage(projectId: id);
          },
        ),
      ],
    ),
  ],
);
