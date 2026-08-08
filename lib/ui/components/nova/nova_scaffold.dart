import 'package:flutter/material.dart';

/// Standard screen chrome for Nova screens: a [Scaffold] with a themed
/// [AppBar] driven by simple parameters, so screens describe *what* to show
/// (title, actions, body) rather than re-assembling the same structure.
///
/// Pass [title] for a text title or [titleWidget] for custom app-bar content
/// (e.g. a search field). Omit both for a scaffold with no app bar.
class NovaScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final bool centerTitle;

  const NovaScaffold({
    super.key,
    required this.body,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.drawer,
    this.centerTitle = false,
  });

  bool get _hasAppBar =>
      title != null ||
      titleWidget != null ||
      leading != null ||
      (actions?.isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _hasAppBar
          ? AppBar(
              title: titleWidget ?? (title != null ? Text(title!) : null),
              actions: actions,
              leading: leading,
              centerTitle: centerTitle,
            )
          : null,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}
