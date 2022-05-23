import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  late IconData icon;
  late String headerTitle;
  Function? onPressed;
  SectionHeader(
      {Key? key, required this.icon, required this.headerTitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: onPressed != null
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColorLight,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              headerTitle,
              style: TextStyle(
                  color: onPressed != null
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
          onPressed != null
              ? OutlinedButton(
                  onPressed: () => onPressed!(),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0, color: Theme.of(context).primaryColorDark),
                  ),
                  child: Text(
                    "View More",
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
