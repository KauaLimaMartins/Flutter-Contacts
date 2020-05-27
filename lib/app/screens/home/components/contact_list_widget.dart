import 'dart:io';

import 'package:flutter/material.dart';

import 'package:contatos/app/models/contact_model.dart';
import 'package:contatos/app/app_controller.dart';

class ContactListWidget extends StatelessWidget {
  ContactListWidget({@required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return _contactCardWidget(index);
      },
    );
  }

  Widget _contactCardWidget(int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: this.contacts[index].image != null
                        ? FileImage(
                            File(contacts[index].image),
                          )
                        : AssetImage(ThemeController.instance.isDark
                            ? 'assets/images/person_white.png'
                            : 'assets/images/person_black.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _textContactWidget(contacts[index].name ?? '', 22.0, true),
                  _textContactWidget(contacts[index].name ?? '', 16.0, false),
                  _textContactWidget(contacts[index].name ?? '', 16.0, false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textContactWidget(String text, double size, bool bold) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : null,
      ),
    );
  }
}
