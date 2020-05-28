import 'package:flutter/material.dart';

import 'package:contatos/app/models/contact_model.dart';
import 'package:contatos/app/components/contact_image_widget.dart';

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
              ContactImageWidget(
                contact: this.contacts[index],
                size: 80.0,
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
