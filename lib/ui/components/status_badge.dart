import 'package:android_app/data/model/my_list_status.dart';
import 'package:android_app/ui/components/nova/nova_pill.dart';
import 'package:android_app/utils/constants/color.dart';
import 'package:flutter/material.dart';

/// Shows the current user's list status for an anime.
///
/// Renders nothing when [listStatus] is null/unknown (guests, or titles not
/// on the user's list). When [compact] is true it draws a small colored
/// corner marker (for narrow tiles); otherwise a labeled pill. The visual is
/// delegated to [NovaPill]; the status→(color, icon, label) mapping comes from
/// [StatusStyle].
class StatusBadge extends StatelessWidget {
  final MyListStatus? listStatus;
  final bool compact;

  /// Total episodes of the anime. Reserved for future episode-progress on the
  /// watching pill; unused for now.
  final int? totalEpisodes;

  const StatusBadge({
    super.key,
    required this.listStatus,
    this.compact = false,
    this.totalEpisodes,
  });

  @override
  Widget build(BuildContext context) {
    final StatusStyle? style = StatusStyle.of(listStatus?.status);
    if (style == null) {
      return const SizedBox.shrink();
    }

    if (compact) {
      return NovaPill.marker(
        color: style.color,
        icon: style.icon,
        semanticsLabel: style.label,
      );
    }

    return NovaPill(
      color: style.color,
      icon: style.icon,
      label: style.label,
      semanticsLabel: style.label,
    );
  }
}
