import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  SwitchWidgetState createState() => SwitchWidgetState();
}

class SwitchWidgetState extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  static final _log = Logger('custom_switch.dart');

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      _log.info('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      _log.info('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Switch(
        onChanged: toggleSwitch,
        value: isSwitched,
        activeColor: Color.fromARGB(255, 25, 22, 231),
        activeTrackColor: Color.fromARGB(255, 197, 197, 197),
        inactiveThumbColor: Colors.redAccent,
        inactiveTrackColor: const Color.fromARGB(255, 116, 116, 116),
      ),
    ]);
  }
}
