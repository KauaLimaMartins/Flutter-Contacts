import 'package:flutter/material.dart';

import 'package:contatos/app/models/contact_model.dart';

import './components/contact_list_widget.dart';
import './components/custom_switch_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContactModel model = ContactModel();

  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();

    model.getAllContacts().then((list) => setState(() => this.contacts = list));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
        leading: CustomSwitchWidget(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ContactListWidget(
        contacts: this.contacts,
      ),
    );
  }
}
