import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../data/demo_data.dart';
import '../widgets/project_tile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? selectedProjectId;
  String? selectedSite;
  DateTimeRange? dateRange;

  @override
  Widget build(BuildContext context) {
    final sites = demoProjects.map((p) => p.site).toSet().toList();

    final filtered = demoProjects.where((p) {
      final okProject = selectedProjectId == null || p.id == selectedProjectId;
      final okSite = selectedSite == null || p.site == selectedSite;
      return okProject && okSite;
    }).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),

          // Filters row
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _filterProject(),
              _filterSite(sites),
              _filterDateRange(),
            ],
          ),
          const SizedBox(height: 16),

          // grid tiles
          LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth;
              final crossAxisCount = w > 1200 ? 3 : (w > 900 ? 2 : 1);

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filtered.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, i) {
                  final project = filtered[i];
                  return ProjectTile(
                    project: project,
                    onTap: () => context.go('/projects/${project.id}'),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _filterProject() {
    return _filterCard(
      child: DropdownButtonFormField<String>(
        initialValue: selectedProjectId,
        decoration: const InputDecoration(
          labelText: 'Project',
          border: OutlineInputBorder(),
        ),
        items: [
          const DropdownMenuItem(value: null, child: Text('All Projects')),
          ...demoProjects.map(
            (p) => DropdownMenuItem(value: p.id, child: Text('${p.id} • ${p.name}')),
          )
        ],
        onChanged: (v) => setState(() => selectedProjectId = v),
      ),
    );
  }

  Widget _filterSite(List<String> sites) {
    return _filterCard(
      child: DropdownButtonFormField<String>(
        initialValue: selectedSite,
        decoration: const InputDecoration(
          labelText: 'Site',
          border: OutlineInputBorder(),
        ),
        items: [
          const DropdownMenuItem(value: null, child: Text('All Sites')),
          ...sites.map((s) => DropdownMenuItem(value: s, child: Text(s))),
        ],
        onChanged: (v) => setState(() => selectedSite = v),
      ),
    );
  }

  Widget _filterDateRange() {
    final label = dateRange == null
        ? "Select date range"
        : "${DateFormat('dd MMM').format(dateRange!.start)} - ${DateFormat('dd MMM').format(dateRange!.end)}";

    return _filterCard(
      child: SizedBox(
        width: 260,
        child: OutlinedButton.icon(
          icon: const Icon(Icons.date_range),
          label: Text(label),
          onPressed: () async {
            final picked = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            );
            if (picked != null) setState(() => dateRange = picked);
          },
        ),
      ),
    );
  }

  Widget _filterCard({required Widget child}) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
