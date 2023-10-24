import 'package:flutter/material.dart';

class NavigateLearnDart extends StatefulWidget {
  const NavigateLearnDart({super.key, this.isOkey = false});
  final bool isOkey;
  @override
  State<NavigateLearnDart> createState() => _NavigateLearnDartState();
}

class _NavigateLearnDartState extends State<NavigateLearnDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).pop(!widget.isOkey);
        },
        icon: Icon(
          Icons.check,
          color: widget.isOkey ? Colors.red : Colors.green,
        ),
        label: widget.isOkey ? const Text('Reddet') : const Text('Onayla'),
      )),
    );
  }
}
