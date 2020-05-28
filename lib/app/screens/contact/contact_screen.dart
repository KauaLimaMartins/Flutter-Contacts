import 'package:flutter/material.dart';

import 'package:contatos/app/models/contact_model.dart';
import 'package:contatos/app/components/contact_image_widget.dart';
import './components/contact_field_widget.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({
    this.contact,
  });

  final Contact contact;

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool _userEdited = false;

  Contact _editedContact;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      this._editedContact = new Contact();
    } else {
      this._editedContact = Contact.fromMap(widget.contact.toMap());

      this._nameController.text = this._editedContact.name;
      this._phoneController.text = this._editedContact.phone;
      this._emailController.text = this._editedContact.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(this._editedContact.name ?? 'Novo Contato'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: ContactImageWidget(
                  contact: this._editedContact,
                  size: 140.0,
                ),
              ),
            ),
            ContactFieldWidget(
              'Nome',
              (text) {
                this._userEdited = true;
                setState(() {
                  this._editedContact.name = text;
                });
              },
              this._nameController,
              correct: false,
            ),
            ContactFieldWidget(
              'Número',
              (text) {
                this._userEdited = true;
                this._editedContact.phone = text;
              },
              this._phoneController,
              typeField: 'phone',
              correct: true,
            ),
            ContactFieldWidget(
              'Email',
              (text) {
                this._userEdited = true;
                this._editedContact.email = text;
              },
              this._emailController,
              typeField: 'email',
              correct: true,
            ),
          ],
        ),
      ),
    );
  }
}
