import 'package:flutter/material.dart';
import 'package:mal_client_v2/Screens/Settings/Header/header_provider.dart';
import 'package:provider/provider.dart';

class ShowHeaderSwitch extends StatefulWidget {
  const ShowHeaderSwitch({Key? key}) : super(key: key);

  @override
  _ShowHeaderSwitchState createState() => _ShowHeaderSwitchState();
}

class _ShowHeaderSwitchState extends State<ShowHeaderSwitch> {
  @override
  Widget build(BuildContext context) {
    HeaderProvider headerProvider =
        Provider.of<HeaderProvider>(context, listen: false);
    bool isHeaderVisible = headerProvider.getVisiblity;
    return SwitchListTile(
      value: isHeaderVisible,
      onChanged: (bool val) {
        setState(() {
          isHeaderVisible = val;
        });
        headerProvider.setHeader(isHeaderVisible);
      },
      title: const Text("Show Header"),
      secondary: const Icon(Icons.credit_card_rounded),
    );
  }
}

void setHeaderState(BuildContext _context, bool _val) {
  HeaderProvider headerProvider =
      Provider.of<HeaderProvider>(_context, listen: false);
  headerProvider.setHeader(_val);
}
