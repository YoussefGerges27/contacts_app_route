import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/ui/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<ContactModel> contacts;
  final Function delete;

  const ContactsScreen({
    super.key,
    required this.contacts,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1 / 1.9,
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactWidget(
            contact: contacts[index],
            deleteIndex: () {
              delete(index);
            },
          );
        },
      ),
    );
  }
}
