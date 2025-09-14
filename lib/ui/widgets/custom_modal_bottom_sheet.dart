import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/ui/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomModalBottomSheet extends StatefulWidget {
  final List<ContactModel> contacts;
  final VoidCallback onAdd;

  const CustomModalBottomSheet({
    super.key,
    required this.contacts,
    required this.onAdd,
  });

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = 'User Name';
  String email = 'example@email.com';
  String phone = '+200000111111';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: AppColors.gold,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Lottie.asset("assets/animations/image_picker.json"),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(color: AppColors.gold),
                    Text(
                      email,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(color: AppColors.gold),
                    Text(
                      phone,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              spacing: 16,
              children: [
                CustomTextFormfeild(
                  onChange: (value) {
                    name = userNameController.text;
                    setState(() {});
                  },
                  controller: userNameController,
                  hintText: "Enter User Name",
                ),
                CustomTextFormfeild(
                  onChange: (value) {
                    email = emailController.text;
                    setState(() {});
                  },
                  controller: emailController,
                  hintText: "Enter User Email",
                ),
                CustomTextFormfeild(
                  onChange: (value) {
                    phone = phoneNumberController.text;
                    setState(() {});
                  },
                  controller: phoneNumberController,
                  hintText: "Enter User Phone",
                ),
              ],
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
            onPressed: () {
              widget.contacts.add(
                ContactModel(
                  image: "assets/images/messi.png",
                  name: userNameController.text,
                  email: emailController.text,
                  phone: phoneNumberController.text,
                ),
              );
              widget.onAdd();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter User",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void addContact() {
  //   widget.contacts.add(
  //     ContactModel(
  //       image: "assets/images/messi.png",
  //       name: userNameController.text,
  //       email: emailController.text,
  //       phone: phoneNumberController.text,
  //     ),
  //   );
  //   widget.onAdd();
  //   Navigator.pop(context);
  // }
}
