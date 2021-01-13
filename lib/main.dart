import 'package:flutter/material.dart';
import 'package:popupmenubutton/models/custom_popup_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popup Menu Button - Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<CustomPopupMenu> choices = [
  CustomPopupMenu(title: 'Home', icon: Icons.home),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
];

class _MyHomePageState extends State<MyHomePage> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popup Menu Button - Example',
        ),
        actions: [
          PopupMenuButton(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('Você não escolheu nenhuma opção');
            },
            onSelected: _select,
            tooltip: 'Escolha uma opção',
            itemBuilder: (context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SelectedOption(choice: _selectedChoices),
    );
  }
}

class SelectedOption extends StatelessWidget {
  final CustomPopupMenu choice;

  const SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              choice.icon,
              size: 140.0,
              color: Colors.blue,
            ),
            Text(
              choice.title,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
