import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/demo_data.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Projects",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Card(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              scrollDirection: Axis.horizontal,
        child: DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Project')),
                  DataColumn(label: Text('Site')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Progress')),
                  DataColumn(label: Text('Cost Health')),
                  DataColumn(label: Text('Timeline Health')),
                ],
                rows: demoProjects.map((p) {
                  return DataRow(
                    onSelectChanged: (_) => context.go('/projects/${p.id}'),
                    cells: [
                      DataCell(Text(p.id)),
                      DataCell(Text(p.name)),
                      DataCell(Text(p.site)),
                      DataCell(Text(p.status)),
                      DataCell(Text('${(p.progress * 100).round()}%')),
                      DataCell(Text(p.costHealth)),
                      DataCell(Text(p.timelineHealth)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
