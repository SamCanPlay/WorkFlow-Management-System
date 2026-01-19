import 'package:flutter/material.dart';

class KpiChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool danger;

  const KpiChip({
    super.key,
    required this.icon,
    required this.label,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = danger ? Colors.red.withValues(alpha: 0.08) : const Color(0xFFF2F4F7);
    final fg = danger ? Colors.red : const Color(0xFF334155);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: fg),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: fg, fontSize: 12)),
        ],
      ),
    );
  }
}
