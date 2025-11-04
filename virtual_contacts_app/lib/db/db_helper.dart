import 'package:path/path.dart' as P;
import 'package:sqflite/sqflite.dart';
import 'package:virtual_contacts_app/models/contact_model.dart';

class DbHelper {
  final String _createTableContact =
      '''
    create table $tblContact($tblContactColId integer primary key autoincrement, 
    $tblContactColName text not null,
    $tblContactColMobile text not null,
    $tblContactColEmail text default '',
    $tblContactColAddress text default '',
    $tblContactColCompany text default '',
    $tblContactColDesignation text default '',
    $tblContactColWebsite text default '',
    $tblContactColImage text default '',
    $tblContactColFavorite integer default 0
    )
  ''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = P.join(root, 'contact.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(_createTableContact);
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion == 1) {
          // do any migration or changes needed
        }
      },
    );
  }

  Future<int> insertContact(ContactModel contactModel) async {
    final db = await _open();
    return db.insert(tblContact, contactModel.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(tblContact);

    return mapList.map((map) => ContactModel.fromMap(map)).toList();
  }

  Future<List<ContactModel>> getAllFavoriteContacts() async {
    final db = await _open();
    final mapList = await db.query(
      tblContact,
      where: '$tblContactColFavorite = ?',
      whereArgs: [1],
    );

    return mapList.map((map) => ContactModel.fromMap(map)).toList();
  }

  Future<int> deleteContact(int id) async {
    final db = await _open();
    return db.delete(
      tblContact,
      where: '$tblContactColId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateFavorite(int id, int value) async {
    final db = await _open();
    return db.update(
      tblContact,
      {tblContactColFavorite: value},
      where: '$tblContactColId = ?',
      whereArgs: [id],
    );
  }
}
