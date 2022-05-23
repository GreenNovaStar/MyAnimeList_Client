import 'package:flutter/material.dart';
import 'package:mal_client_v2/Theme_Data/theme_data.dart';
import 'package:mal_client_v2/Theme_Data/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSettings extends StatefulWidget {
  const ThemeSettings({Key? key}) : super(key: key);

  @override
  _ThemeSettingsState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  @override
  Widget build(BuildContext context) {
    // ThemeProvider themeProvider =
    //     Provider.of<ThemeProvider>(context, listen: false);
    return ListTile(
      onTap: () {
        int newThemeIndex = -1;
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text('Themes'),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: themes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            newThemeIndex = index;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: themes[index].primaryColor,
                            border: index == newThemeIndex
                                ? Border.all(
                                    color: Colors.black,
                                    width: 3.0,
                                  )
                                : Border.all(
                                    color: Colors.transparent,
                                  ),
                          ),
                        ),
                      );
                    }),
              ),
              actions: [
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (newThemeIndex != -1) {
                        ThemeProvider themeProvider =
                            Provider.of<ThemeProvider>(context, listen: false);
                        themeProvider.setTheme(newThemeIndex);
                      }

                      Navigator.pop(context);
                    },
                    child: newThemeIndex != -1
                        ? const Text('Confirm')
                        : const Text("Go Back"),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: Text('Go Back')),
              ],
            );
          }),
        );
      },
      leading: const Icon(Icons.palette),
      title: const Text("Themes"),
      trailing: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
