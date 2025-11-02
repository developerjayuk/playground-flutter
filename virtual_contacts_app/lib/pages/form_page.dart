import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:virtual_contacts_app/models/contact_model.dart';
import 'package:virtual_contacts_app/pages/home_page.dart';
import 'package:virtual_contacts_app/provider/contact_provider.dart';
import 'package:virtual_contacts_app/utils/constants.dart';
import 'package:virtual_contacts_app/utils/helper_functions.dart';

class FormPage extends StatefulWidget {
  static const String routeName = 'form';
  final ContactModel contactModel;

  const FormPage({super.key, required this.contactModel});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final designationController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.contactModel.name;
    mobileController.text = widget.contactModel.mobile;
    emailController.text = widget.contactModel.email;
    companyController.text = widget.contactModel.company;
    addressController.text = widget.contactModel.address;
    designationController.text = widget.contactModel.designation;
    websiteController.text = widget.contactModel.website;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        actions: [
          IconButton(onPressed: saveContact, icon: const Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Contact Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldError;
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile No.'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldError;
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: companyController,
              decoration: InputDecoration(labelText: 'Company'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: designationController,
              decoration: InputDecoration(labelText: 'Designation'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: websiteController,
              decoration: InputDecoration(labelText: 'Website'),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    companyController.dispose();
    addressController.dispose();
    designationController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  void saveContact() async {
    if (_formKey.currentState!.validate()) {
      widget.contactModel.name = nameController.text;
      widget.contactModel.mobile = mobileController.text;
      widget.contactModel.email = emailController.text;
      widget.contactModel.company = companyController.text;
      widget.contactModel.address = addressController.text;
      widget.contactModel.designation = designationController.text;
      widget.contactModel.website = websiteController.text;
    }

    try {
      final value = await Provider.of<ContactProvider>(
        context,
        listen: false,
      ).insertContact(widget.contactModel);
      if (mounted && value > 0) {
        showMessage(context, 'Successfully saved');
        context.goNamed(HomePage.routeName);
      }
    } catch (error) {
      if (mounted) {
        print(error);
        showMessage(context, 'Error, please check logs');
      }
    }
  }
}
