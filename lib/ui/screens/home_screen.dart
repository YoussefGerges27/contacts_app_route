import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/ui/widgets/contact_widget.dart';
import 'package:contacts/ui/widgets/contacts_screen.dart';
import 'package:contacts/ui/widgets/custom_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/route_logo.png"),
        backgroundColor: AppColors.darkBlue,
      ),
      backgroundColor: AppColors.darkBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.darkBlue,
            context: context,
            builder: (context) {
              return CustomModalBottomSheet(
                contacts: contacts,
                onAdd: () {
                  setState(() {});
                },
              );
            },
          );
        },
        backgroundColor: AppColors.gold,
        child: Icon(Icons.add),
      ),
      body: contacts.isEmpty
          ? Center(child: Lottie.asset("assets/animations/empty_list.json"))
          : ContactsScreen(
              contacts: contacts,
              delete: deleteContactByIndex,
            ),
    );
  }

  void deleteContactByIndex(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }
}
