import 'dart:io';

import 'package:flutter/material.dart';

import 'package:contatos/app/app_controller.dart';
import '../models/contact_model.dart';

class ContactImageWidget extends StatelessWidget {
  ContactImageWidget({
    @required this.contact,
    @required this.size,
  });

  final Contact contact;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: this.contact.image != null
              ? FileImage(
                  File(contact.image),
                )
              : AssetImage(ThemeController.instance.isDark
                  ? 'assets/images/person_white.png'
                  : 'assets/images/person_black.png'),
        ),
      ),
    );
  }
}
