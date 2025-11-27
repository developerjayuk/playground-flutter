import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_contacts_app/models/contact_model.dart';
import 'package:virtual_contacts_app/provider/contact_provider.dart';
import 'package:virtual_contacts_app/utils/helper_functions.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = 'details';

  final int id;
  const ContactDetailsPage({super.key, required this.id});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late int id;

  @override
  void initState() {
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Details')),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => FutureBuilder<ContactModel?>(
          future: provider.getContactById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final contact = snapshot.data!;
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Image.file(
                    File(contact.image),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                  ListTile(
                    title: Text(contact.mobile),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            callContact(contact.mobile);
                          },
                          icon: const Icon(Icons.call),
                        ),
                        IconButton(
                          onPressed: () {
                            sendSms(contact.mobile);
                          },
                          icon: const Icon(Icons.sms),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text('Failed to load contact details'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callContact(String mobile) async {
    final url = Uri.parse('tel:$mobile');
    if (!await canLaunchUrl(url)) {
      if (!mounted) return;
      showMessage(context, 'Could not launch $mobile');
    } else {
      await launchUrl(url);
    }
  }

  void sendSms(String mobile) async {
    final url = Uri.parse('sms:$mobile');
    if (!await canLaunchUrl(url)) {
      if (!mounted) return;
      showMessage(context, 'Could not launch $mobile');
    } else {
      await launchUrl(url);
    }
  }
}
