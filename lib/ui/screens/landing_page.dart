import 'package:android_app/data/auth/authentication.dart';
import 'package:android_app/data/model/user_type.dart';
import 'package:android_app/utils/constants/size.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6A1B9A), Color(0xFFE91E63), Color(0xFFFF6D00)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: NovaSize.spaceLg * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),

                // Branding
                Container(
                  padding: const EdgeInsets.all(NovaSize.spaceLg),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(NovaSize.radiusTile),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                      const SizedBox(height: NovaSize.spaceMd),
                      Text(
                        "NOVA",
                        style: NovaType.display.copyWith(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: NovaSize.spaceSm),
                      Text(
                        "Your anime universe, unified.",
                        style: NovaType.body.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 3),

                // Sign-in section
                Container(
                  padding: const EdgeInsets.all(NovaSize.spaceLg + 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(NovaSize.radiusTile),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Service icons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _ServiceIcon(
                            icon: Icons.catching_pokemon_rounded,
                            color: const Color(0xFF2E51A2),
                            label: "MAL",
                            selected: true,
                          ),
                          const SizedBox(width: NovaSize.spaceLg * 2),
                          _ServiceIcon(
                            icon: Icons.auto_awesome_rounded,
                            color: const Color(0xFF02A9FF),
                            label: "AniList",
                            selected: false,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("AniList support coming soon!"),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: NovaSize.spaceLg + 4),
                      Container(
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      const SizedBox(height: NovaSize.spaceLg),
                      // Actions
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: FilledButton(
                                onPressed: () =>
                                    authorizeUser(context, UserType.USER),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF6A1B9A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      NovaSize.radiusBadge,
                                    ),
                                  ),
                                ),
                                child: const Text("Sign in"),
                              ),
                            ),
                          ),
                          const SizedBox(width: NovaSize.spaceMd),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () =>
                                    authorizeUser(context, UserType.GUEST),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.3),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      NovaSize.radiusBadge,
                                    ),
                                  ),
                                ),
                                child: const Text("Guest"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _ServiceIcon({
    required this.icon,
    required this.color,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: selected ? 1.0 : 0.4,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: selected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: selected
                    ? null
                    : Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Icon(
                icon,
                color: selected ? color : Colors.white38,
                size: 28,
              ),
            ),
            const SizedBox(height: NovaSize.spaceSm),
            Text(
              label,
              style: NovaType.label.copyWith(
                color: selected ? Colors.white : Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
