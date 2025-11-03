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

  Future<int> deleteContact(int id) async {
    return db.deleteContact(id);
  }

  Future<void> updateFavorite(ContactModel contactModel) async {
    final toggle = !contactModel.favorite;
    final value = toggle ? 1 : 0;
    await db.updateFavorite(contactModel.id, value);

    final index = contactList.indexOf(contactModel);
    contactList[index].favorite = toggle;

    notifyListeners();
  }
}
