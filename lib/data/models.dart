class Project {
  final String id;
  final String name;
  final String site;
  final String status; // planned / ongoing / on-hold / completed
  final double progress; // 0 to 1
  final int delayDays;
  final int todaysTasks;

  // finance
  final int duePayments;
  final int receivedPayments;
  final int pendingApprovals;

  // materials
  final int lowStockItems;
  final int delayedDeliveries;

  // labour
  final int labourPresent;
  final int labourAbsent;

  // alerts
  final int criticalAlerts;

  // health
  final String costHealth; // Good / Warning / Critical
  final String timelineHealth;

  const Project({
    required this.id,
    required this.name,
    required this.site,
    required this.status,
    required this.progress,
    required this.delayDays,
    required this.todaysTasks,
    required this.duePayments,
    required this.receivedPayments,
    required this.pendingApprovals,
    required this.lowStockItems,
    required this.delayedDeliveries,
    required this.labourPresent,
    required this.labourAbsent,
    required this.criticalAlerts,
    required this.costHealth,
    required this.timelineHealth,
  });
}
