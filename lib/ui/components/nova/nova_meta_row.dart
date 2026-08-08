import 'package:android_app/utils/constants/color.dart';
import 'package:android_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

/// A single line of dot-separated metadata, e.g. `TV · 24 ep · 2013`.
///
/// [items] accepts a mix of [String?] and [Widget]. Strings are rendered as
/// styled text; widgets are placed inline as-is. Null and empty string entries
/// are dropped before joining. Renders nothing when no entries survive.
/// Set [onScrim] when placing over poster art.
class NovaMetaRow extends StatelessWidget {
  final List<Object?> items;
  final bool onScrim;
  final String separator;

  const NovaMetaRow({
    super.key,
    required this.items,
    this.onScrim = false,
    this.separator = ' · ',
  });

  @override
  Widget build(BuildContext context) {
    final filtered = items.where((item) {
      if (item == null) return false;
      if (item is String) return item.trim().isNotEmpty;
      return true;
    }).toList();
    if (filtered.isEmpty) return const SizedBox.shrink();

    final Color fg = onScrim
        ? NovaColors.onScrimMuted
        : Theme.of(context).colorScheme.onSurfaceVariant;
    final style = NovaType.caption.copyWith(color: fg);

    final children = <Widget>[];
    for (var i = 0; i < filtered.length; i++) {
      if (i > 0) {
        children.add(Text(separator, style: style));
      }
      final item = filtered[i];
      if (item is Widget) {
        children.add(item);
      } else {
        children.add(
          Flexible(
            child: Text(
              (item as String).trim(),
              style: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }
}
