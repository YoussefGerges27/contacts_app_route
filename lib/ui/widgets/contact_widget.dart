import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback deleteIndex;
  const ContactWidget({
    super.key,
    required this.contact,
    required this.deleteIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              contact.image == null
                  ? Lottie.asset("assets/animations/image_picker.json")
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.file(
                        contact.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  contact.name,
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/email.svg",
              width: 30,
            ),
            title: Text(
              contact.email,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/phone.svg",
              width: 30,
            ),
            title: Text(
              contact.phone,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF93E3E),
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              onPressed: () {
                deleteIndex();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 8),
                  Text("Delete"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
