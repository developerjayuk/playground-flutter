import 'package:flutter/foundation.dart';
import 'package:virtual_contacts_app/db/db_helper.dart';
import 'package:virtual_contacts_app/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  Future<int> insertContact(ContactModel contactModel) async {
    final id = await db.insertContact(contactModel);
    contactModel.id = id;

    contactList.add(contactModel);
    notifyListeners();
    return id;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }
}
