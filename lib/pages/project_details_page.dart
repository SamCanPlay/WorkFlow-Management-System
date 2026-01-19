import 'package:flutter/material.dart';
import '../data/demo_data.dart';
import '../data/models.dart';

class ProjectDetailsPage extends StatefulWidget {
  final String projectId;
  const ProjectDetailsPage({super.key, required this.projectId});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 11, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Project project =
        demoProjects.firstWhere((p) => p.id == widget.projectId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        Row(
          children: [
            Expanded(
              child: Text(
                "${project.name} (${project.id})",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Chip(label: Text(project.status)),
          ],
        ),
        Text("Site: ${project.site}", style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 12),

        // tabs
        Card(
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(text: 'Overview'),
              Tab(text: 'Schedule'),
              Tab(text: 'Tasks'),
              Tab(text: 'Materials'),
              Tab(text: 'Labour'),
              Tab(text: 'Expenses'),
              Tab(text: 'Photos'),
              Tab(text: 'Approvals'),
              Tab(text: 'Documents'),
              Tab(text: 'Payments'),
              Tab(text: 'Notes/Logs'),
            ],
          ),
        ),
        const SizedBox(height: 12),

        Expanded(
          child: Card(
            child: TabBarView(
              controller: tabController,
              children: [
                _placeholder('Overview'),
                _placeholder('Schedule (Gantt / Calendar placeholder)'),
                _placeholder('Tasks'),
                _placeholder('Materials'),
                _placeholder('Labour'),
                _placeholder('Expenses'),
                _placeholder('Photos / Site updates'),
                _placeholder('Approvals'),
                _placeholder('Documents'),
                _placeholder('Payments / Invoices'),
                _placeholder('Notes / Logs'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _placeholder(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
