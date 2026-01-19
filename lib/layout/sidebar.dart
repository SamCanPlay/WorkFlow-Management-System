import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final bool collapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.collapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final width = collapsed ? 76.0 : 240.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width,
      color: const Color(0xFF0F172A),
      child: Column(
        children: [
          const SizedBox(height: 8),
          _sideHeader(context),
          const Divider(color: Colors.white24, height: 1),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _navItem(
                  context,
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  route: '/dashboard',
                ),
                _navItem(
                  context,
                  icon: Icons.apartment_rounded,
                  label: 'Projects',
                  route: '/projects',
                ),

                const SizedBox(height: 12),
                const Divider(color: Colors.white24),

                // Placeholder links for future pages
                _navItem(context,
                    icon: Icons.task_alt, label: 'Tasks', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.calendar_month,
                    label: 'Schedule',
                    route: '/dashboard'),
                _navItem(context,
                    icon: Icons.groups, label: 'Labour', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.inventory_2,
                    label: 'Materials',
                    route: '/dashboard'),
                _navItem(context,
                    icon: Icons.local_shipping,
                    label: 'Vendors',
                    route: '/dashboard'),
                _navItem(context,
                    icon: Icons.account_balance_wallet,
                    label: 'Finance',
                    route: '/dashboard'),
                _navItem(context,
                    icon: Icons.verified, label: 'Approvals', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.folder, label: 'Documents', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.analytics, label: 'Reports', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.forum, label: 'Communication', route: '/dashboard'),
                _navItem(context,
                    icon: Icons.settings, label: 'Settings', route: '/dashboard'),
              ],
            ),
          ),

          // bottom-left placeholder button
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: collapsed ? const SizedBox.shrink() : const Text("New"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.grid_view_rounded, color: Colors.white),
          if (!collapsed) ...[
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              collapsed ? Icons.chevron_right : Icons.chevron_left,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    final isActive = GoRouterState.of(context).uri.toString() == route;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: isActive ? Colors.white12 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            if (!collapsed) ...[
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
