import 'package:flutter/material.dart';

import 'package:contatos/app/app_controller.dart';

class ContactFieldWidget extends StatelessWidget {
  ContactFieldWidget(
    this._label,
    this._change,
    this._controller, {
    this.typeField,
    this.correct,
  });

  final TextEditingController _controller;
  final String _label;
  final Function _change;
  final String typeField;
  final bool correct;

  TextInputType _inputType() {
    switch (this.typeField) {
      case 'phone':
        return TextInputType.phone;
        break;
      case 'email':
        return TextInputType.emailAddress;
        break;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: TextField(
        controller: this._controller,
        cursorColor:
            ThemeController.instance.isDark ? Colors.tealAccent : Colors.teal,
        style: TextStyle(
          fontSize: 22.0,
          color:
              ThemeController.instance.isDark ? Colors.tealAccent : Colors.teal,
        ),
        autocorrect: this.correct,
        keyboardType: this._inputType(),
        decoration: InputDecoration(
          labelText: this._label,
          labelStyle: TextStyle(
            fontSize: 22.0,
            color: ThemeController.instance.isDark
                ? Colors.tealAccent
                : Colors.teal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeController.instance.isDark
                  ? Colors.tealAccent
                  : Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeController.instance.isDark
                  ? Colors.tealAccent
                  : Colors.teal,
              width: 2.5,
            ),
          ),
        ),
        onChanged: this._change,
      ),
    );
  }
}
