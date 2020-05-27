import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String contactTable = 'contact';
final String idColumn = 'id';
final String nameColumn = 'name';
final String emailColumn = 'email';
final String phoneColumn = 'phone';
final String imageColumn = 'image';

class ContactModel {
  static final ContactModel _instance = ContactModel.internal();

  factory ContactModel() => _instance;

  ContactModel.internal();

  Database _database;

  Future<Database> get database async {
    if (this._database != null) {
      return this._database;
    } else {
      this._database = await this.initDb();
      return this._database;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'contacts.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database database, int newerVersion) async {
      await database.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imageColumn TEXT)");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await database;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  Future<Contact> getContact(int id) async {
    Database dbContact = await database;
    List<Map> contacts = await dbContact.query(
      contactTable,
      columns: [idColumn, nameColumn, emailColumn, phoneColumn, imageColumn],
      where: "$idColumn = ?",
      whereArgs: [id],
    );

    if (contacts.length > 0) {
      return Contact.fromMap(contacts.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database dbContact = await database;
    return await dbContact.delete(
      contactTable,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateContact(Contact contact) async {
    Database dbContact = await database;
    return await dbContact.update(contactTable, contact.toMap(),
        where: '$idColumn = ?', whereArgs: [contact.id]);
  }

  Future<List<Contact>> getAllContacts() async {
    Database dbContact = await database;
    List listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
    List<Contact> allContacts = List();

    for (Map map in listMap) {
      allContacts.add(Contact.fromMap(map));
    }

    return allContacts;
  }

  Future<int> getContctLength() async {
    Database dbContact = await database;

    return Sqflite.firstIntValue(
        await dbContact.rawQuery('SELECT COUNT(*) from $contactTable'));
  }

  Future<void> closeDb() async {
    Database dbContact = await database;

    await dbContact.close();
  }
}

class Contact {
  Contact();

  Contact.fromMap(Map map) {
    this.id = map[idColumn];
    this.name = map[nameColumn];
    this.email = map[emailColumn];
    this.phone = map[phoneColumn];
    this.image = map[imageColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: this.name,
      emailColumn: this.email,
      phoneColumn: this.phone,
      imageColumn: this.image,
    };
    if (id != null) {
      map[idColumn] = this.id;
    }

    return map;
  }

  int id;
  String name;
  String email;
  String phone;
  String image;

  @override
  String toString() {
    return 'Contact: id: $id, name: $name, email: $email, phone: $phone, image: $image';
  }
}
