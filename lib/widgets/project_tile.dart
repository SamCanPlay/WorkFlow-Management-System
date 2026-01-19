import 'package:flutter/material.dart';
import '../data/models.dart';
import 'kpi_chip.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectTile({super.key, required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      project.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text(project.status),
                    backgroundColor: const Color(0xFFF2F4F7),
                  )
                ],
              ),
              Text('${project.id} • ${project.site}',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 10),

              // progress
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: project.progress,
                        minHeight: 10,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('${(project.progress * 100).round()}%'),
                ],
              ),
              const SizedBox(height: 10),

              // required summary items
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  // Active project summary
                  KpiChip(
                      icon: Icons.schedule,
                      label: 'Delay: ${project.delayDays}d'),
                  KpiChip(
                      icon: Icons.task_alt,
                      label: "Today tasks: ${project.todaysTasks}"),

                  // Payment tracker
                  KpiChip(
                      icon: Icons.payments_outlined,
                      label: "Due: ${project.duePayments}"),
                  KpiChip(
                      icon: Icons.check_circle_outline,
                      label: "Received: ${project.receivedPayments}"),
                  KpiChip(
                      icon: Icons.approval_outlined,
                      label: "Pending approvals: ${project.pendingApprovals}"),

                  // Material status
                  KpiChip(
                      icon: Icons.inventory_2_outlined,
                      label: "Low stock: ${project.lowStockItems}"),
                  KpiChip(
                      icon: Icons.local_shipping_outlined,
                      label: "Delayed: ${project.delayedDeliveries}"),

                  // Labour attendance
                  KpiChip(
                      icon: Icons.groups,
                      label:
                          "Labour P/A: ${project.labourPresent}/${project.labourAbsent}"),

                  // critical alerts
                  if (project.criticalAlerts > 0)
                    KpiChip(
                      icon: Icons.warning_amber_rounded,
                      label: "Alerts: ${project.criticalAlerts}",
                      danger: true,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
